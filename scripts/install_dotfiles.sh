#! /usr/bin/env zsh

# Copying dotfiles
DOTFILES=(.zshrc .zprofile .gitconfig .gitignore .hushlogin)

for dotfile in "${DOTFILES[@]}";
do
    echo "Processing $dotfile ..."
    TARGET_FILE="$HOME/$dotfile"
    SOURCE_URL="https://raw.githubusercontent.com/404mat/setup-mac/HEAD/dotfiles/$dotfile"

    # Download the file using curl, overwriting if it exists
    echo "Downloading $dotfile from GitHub to $TARGET_FILE..."
    if curl -fsSL "$SOURCE_URL" -o "$TARGET_FILE"; then
        echo "$dotfile downloaded successfully."
    else
        echo "Error downloading $dotfile from $SOURCE_URL."
        # Remove the potentially empty file created by -o on error
        rm -f "$TARGET_FILE"
    fi
    echo ""
done

echo ""
echo "All dotfiles have been initialized."
