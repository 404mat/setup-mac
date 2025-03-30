#! /usr/bin/env bash

# Sourcing zshrc in zprofile (create if it does not exists)
if [ ! -f $HOME/.zprofile ]; then
    echo "Zsh profile does not exist, creating .zprofile ..."
    touch $HOME/.zprofile
fi
echo "Appending Zsh profile with .zshrc sourcing on startup ..."
echo ""
echo 'if [ -f $HOME/.zshrc ]; then
    source $HOME/.zshrc
fi' >> $HOME/.zprofile

# Copying dotfiles
DOTFILES=(.zshrc .gitconfig .gitignore .hushlogin)

for dotfile in "${DOTFILES[@]}"; # Use modern array iteration
do
    echo "Processing $dotfile ..."
    TARGET_FILE="$HOME/$dotfile"
    SOURCE_URL="https://raw.githubusercontent.com/404mat/setup-mac/HEAD/dotfiles/$dotfile"

    # Check if the target file already exists
    if [ -f "$TARGET_FILE" ]; then
        echo ""
        echo "$dotfile already exists at $TARGET_FILE!"
        echo "Do you want to replace it with the version from the remote source?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes )
                    echo "Downloading $dotfile from GitHub..."
                    # Download the file using curl, overwrite existing
                    if curl -fsSL "$SOURCE_URL" -o "$TARGET_FILE"; then
                        echo "$dotfile downloaded successfully to $TARGET_FILE."
                    else
                        echo "Error downloading $dotfile from $SOURCE_URL."
                    fi
                    echo ""; break;;
                No )
                    echo "Skipping $dotfile."; echo ""; break;;
            esac
        done
    else
        # File does not exist, download it
        echo "Downloading $dotfile from GitHub to $TARGET_FILE..."
        if curl -fsSL "$SOURCE_URL" -o "$TARGET_FILE"; then
            echo "$dotfile downloaded successfully."
        else
            echo "Error downloading $dotfile from $SOURCE_URL."
            # Optionally remove the potentially empty file created by -o on error
            rm -f "$TARGET_FILE" 
        fi
    fi
    echo ""
done

echo ""
echo "All dotfiles have been initialized."
