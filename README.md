# MacOS : Setup

This is the way I setup all Mac computers when I do a fresh install. Feel free to follow along and take what you like from it.

## First steps

You can start by installing the Xcode CLI tools by running `xcode-select --install` in the terminal. Most of the tools used in this configuration needs this.

Install all the config files (dotfiles) using [the installation script](dotfiles/install_dotfiles.sh).

You can then install the Xcode ***app*** from the App Store, it will take a lot of time.

## Dock and Finder

You can use the [configure_dock_finder.sh](utilities/configure_dock.sh) script to easily set up your Dock and Finder settings. Here are other settings you can input manually :

 - Settings :
	 - General :
		 - Theme > *Auto*
	 - Desktop & Dock :
		 - Click wallpaper to reveal desktop > *Only in Stage Manager*
		 - Double click a window's title bar to > *Minimize*
		 - Hot corners > *⌘ Desktop* in bottom left
	 - Notifications : disable all you can
 - Clear dock of unwanted apps
 - General :
	 - New Finder window show > select root folder
	 - Open folders in tabs instead of new window > on
 - Remove unused items from sidebar
- Right click > activate snap to grid

## Homebrew

Install [Homebrew](https://brew.sh/) : ``/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``

You can then install this GUI called [Cork](https://github.com/buresdv/Cork) if you want. It is used to graphically manage Homebrew packages on you Mac.  
Use this [Brewfile](homebrew/Brewfile) to install all the recommended programs. Or use the [associated script](homebrew/install_brewfile.sh) to install it automatically.

## Raycast

Make sure Raycast is installed. (If you installed all the brew utilities, then it may already be on your computer at this point).

You can configure hotkeys to open apps with ⌥ + first letter of app. These are the one I use: *Notion*, *Arc*, *Visual Studio Code* (C), *Discord* and *Spotify*.

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

Install [iTerm2](https://iterm2.com/) (using Homebrew is recommanded, this program is also in the Brewfile). Then type in these settings :
 - Profiles:
	 - Keys > Key mappings > *Natural Text Editing* (Presets dropdown, then agree to remove all existing keymaps when asked)
	 - General > *reuse previous session's directory*
	 - Text > Font > *Anonymous Pro* (must be installed, they are installed via Homebrew, or alternatively see [the install script](fonts/install_fonts.sh))

Then install this color scheme. (TODO : link to file)

Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).  
This facilitates git commands to GitHub.

Install [oh-my-zsh](https://ohmyz.sh/). Use the config (TODO : link to config) script to install the settings with all other dotfiles, or copy the contents of the .zshrc and other config files to you own config.

Install [nvm](https://github.com/nvm-sh/nvm). Accept the prompt asking you to take over your Node config. If you used my Homebrew config, you already have Node installed.  
In some case, maybe *nvm* will not be able to find your Node folder with your executables. You can adjust the *$NODE_PATH* environment variable to fix this.

## Development
Install Visual Studio Code. You can do it from Homebrew. Then, use [these settings](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.
Create a ***dev*** folder in the home directory. This is where all projects will live.

Launch visual studio code, type in the shortcut ⌘ + ⇧ + P to open the command palette, then type `Install 'code' command in PATH`. This will allow you to open a directory directly from the terminal using the `code` command followed by the path of the directory (typically `code .` to open the current path).

Use Homebrew to install your favorite flavor of the JDK. *OpenJDK* is already installed if you use my Homebrew config.

You can also install *Docker Desktop* for Mac directly from [the official website](https://www.docker.com/products/docker-desktop/) (or again, in the Homebrew configuration 😋).


## General use apps
- Arc
- Bitwarden
- Discord
- Spotify
- VLC (backup for iina)

## Utilities
Here are a few utilities that cannot yet be installed via Homebrew. All the others are already installed when using the [Brewfile](homebrew/Brewfile).
- [Loop](https://github.com/MrKai77/Loop)
- Linear mouse
- Amphetamine
- AltTab (in the brewfile, but you need to swap ⌘Tab with Alt+Tab afterwards in settings)
- [BatFi](https://micropixels.software/apps/batfi)

## Appearence
I personnally prefer to use a somewhat coherent theme when I use my apps. You can find a few sets of these in the [icons folder](icons). You can change the icon of a designated app by going into it's info (⌘ + I), and dragging the new icon on the old icon in the window that appears.  
Some apps will revert to their default icons when you restart your computer or when you update the app. That's why I use the [Iconchamp](https://www.macenhance.com/iconchamp.html) app so it manages them and reapply the icon when then app doesn't behave.

## References
https://macos-defaults.com/

https://macosicons.com/#/