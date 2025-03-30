# MacOS : Setup

This is the way I setup all Mac computers when I do a fresh install.

## First steps

Install all the config files (dotfiles) using [the installation script](dotfiles/install_dotfiles.sh).

You can start by installing the Xcode CLI tools by running `xcode-select --install` in the terminal. Most of the tools used in this configuration needs this.

You can then install the Xcode **_app_** from the App Store, it will take a lot of time.

## Dock and Finder

You can use the [configure_dock_finder.sh](utilities/configure_dock_finder.sh) script to easily set up your Dock and Finder settings. Here are other settings you can input manually :

- Settings :
  - General :
    - Theme > _Auto_
  - Desktop & Dock :
    - Click wallpaper to reveal desktop > _Only in Stage Manager_
    - Double click a window's title bar to > _Minimize_
    - Hot corners > _⌘ Desktop_ in bottom right (Windows-like)
  - Notifications : disable all you can
- Clear dock of unwanted apps
- General :
  - New Finder window show > select root folder
  - Open folders in tabs instead of new window > on
- Remove unused items from sidebar
- Right click > activate snap to grid

## Homebrew

Install [Homebrew](https://brew.sh/) : `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Use this [Brewfile](homebrew/Brewfile) to install all the recommended programs. Or use the [associated script](homebrew/install_brewfile.sh) to install it automatically.

## Raycast

- Plugins :
  - Utilities
    - Brew
    - Google Translate
    - Notion
    - Bitwarden Vault
  - Browsers
    - Chrome
    - Zen
  - Development
    - Tailwind CSS
    - Search npm packages

For a quick install of all these settings, you can use [this settings file](raycast/.rayconfig) as your configuration and import it il Raycast via the UI.

## Terminal

Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).

## Development

Use [these settings](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.
Create a **_dev_** folder in the home directory. This is where all projects will live.

In VSCode, use the command palette `⌘ + ⇧ + P` and `Install 'code' command in PATH`, then press `Enter`. This activates the `code .` shortcut.

## General use apps

- Dropzone 4
- Swish
- Mediamate
- Bartender

## References

https://macos-defaults.com/
