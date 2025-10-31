## Installation done !

Your Mac is now hopefully setup. It some steps failed, execute them manually to complete the setup.

You will nedd to complete these steps manually :

- Set the default browser
- Enter licence key for these apps : _Eagle_, _TabTab_
- Install [Starship](https://starship.rs/) to customize the shell prompt (use the [config file](./config-files/starship/starship.toml))
- Install these apps:
  - _CleanShot X_
  - _Affinity Designer_
  - _Affinity Photo_
  - _Dropzone 4_
  - _Framous_
  - _Hazel_
  - _Little Snitch_
  - _Mediamate_ (or open source equivalent)
  - _Swish_
- Install these fonts : _Berkeley Mono_

### Menu bar

The menu bar should look like this :

![Menubar Order](./images/menubar-order.png)

### Manual steps

- You can start by installing the Xcode CLI tools. Run `xcode-select --install` in the terminal. Most of the tools used in this configuration needs this.

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

- Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac).

- Use [these settings](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.
  Create a **_dev_** folder in the home directory. This is where all projects will live.

- In VSCode, use the command palette `⌘ + ⇧ + P` and `Install 'code' command in PATH`, then press `Enter`. This activates the `code .` shortcut.

### Miscellaneous

- Wallpaper is from Resend Raycast extension
