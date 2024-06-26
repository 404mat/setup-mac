# MacOS : Setup
This is the way I setup all Mac computers when I do a fresh install. Feel free to follow along and take what you like from it.

You can start by installing all the config files (dotfiles) using [the installation script](dotfiles/install_dotfiles.sh).

In the mean time, install ***Xcode*** from the App Store, as it is the signgle thing that will take the most time.

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

## Homebrew

Install [Homebrew](https://brew.sh/) : 

``/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``

You can then install this GUI called [Cork](https://github.com/buresdv/Cork) if you want.

Use this [Brewfile](homebrew/Brewfile) to install all the recommended programs. Or use the associated script to install it automatically.

## Raycast
Make sure Raycast is installed. (If you installed all the brew utilities, then it may already be on your computer at this point).

You can configure hotkeys to open apps with ⌥ + first letter of app. These are the one I use: Notion, Arc, Visual Studio Code (C), Discord and Spotify.

- Plugins :
	- Utilities
		- Brew
		- Google Translate
		- Notion
		- Color Picker
	 	- Spotify Player
		- System Monitor
		- Bitwarden Vault
		- Emoji Search
	- Browsers
		- Chrome
		- Arc
		- Google Search
	- Development
		- Visual Studio Code
		- Tailwind CSS
		- Search npm packages

For a quick install of all these settings, you can use [this settings file](raycast/.rayconfig) as your configuration and import it il Raycast via the UI.

## Terminal

Install [iTerm2](https://iterm2.com/) (using brew is recommanded). Then type in these settings :
 - Profiles:
	 - Keys > Key mappings > *Natural Text Editing* (Presets dropdown, then remove all existing keymaps when asked)
	 - General > *reuse previous session's directory*
	 - Text > Font > *Anonymous Pro* (must be installed, see linked file)
Then install this color scheme. (to link or to file)

Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac). This facilitates git commands to GitHub.

Install [oh-my-zsh](https://ohmyz.sh/). Use the config (link) script to install the settings with all other dotfiles, or copy the contents of the .zshrc and other config files to you own config. (link to files) https://github.com/w3cj/dotfiles

Install [nvm](https://github.com/nvm-sh/nvm). Then proceed with the download of the latest Node version.

## Development
Install Visual Studio Code. You can do it from Brew. Then, use [these settings](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.

Create a ***dev*** folder in the home directory. This is where all projects will live.

Launch visual studio code, type ⌘ + ⇧ + P to open the command palette, then type ``Install 'code' command in PATH``. This will allow you to open a diretori directly from the terminal using the ``code`` command.

Use Homebrew to install your favorite flavor of OpenJDK.

You can also install Docker Desktop for Mac directly from [the official website](https://www.docker.com/products/docker-desktop/).

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
- [Loop](https://github.com/MrKai77/Loop)
- Hidden Bar
- Time since login in menubar (find it)
- Linear mouse
- App Cleaner
- Amphetamine
- Latest
- Dropzone 4
- AltTab (swap ⌘Tab with Alt+Tab afterwards in settings)
- Stats
- Itsycal

## Appearence
I personnally prefer to use a somewhat coherent theme when I use my apps. You can find a few sets of these in the [icons folder](icons).

## References
https://macos-defaults.com/

https://macosicons.com/#/