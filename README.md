# MacOS : Setup

This is the way I setup all Mac computers when I do a fresh install.

Just execute this command in your terminal :

```console
curl -fsSL https://example.com/script.sh | bash
```

## Manual steps

- You can start by installing the Xcode CLI tools by running `xcode-select --install` in the terminal. Most of the tools used in this configuration needs this.

- You can then install the Xcode **app** from the App Store, _it will take a lot of time_.

- Here are Finder settings you need to input manually :

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

- Verify Raycast install (For a quick install of all these settings, you can use [this settings file](raycast/.rayconfig) as your configuration and import it in Raycast via the UI)

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

- Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).

- Use [these settings](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.
  Create a **_dev_** folder in the home directory. This is where all projects will live.

- In VSCode, use the command palette `⌘ + ⇧ + P` and `Install 'code' command in PATH`, then press `Enter`. This activates the `code .` shortcut.

## General use apps to install

- Dropzone 4
- Swish
- Mediamate
- Bartender

## References

https://macos-defaults.com/
