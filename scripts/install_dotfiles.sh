#! /usr/bin/env zsh

echo "Starting installation of dotfiles..."

# Define the destination directory on the local machine
DEST_DIR="$HOME"

# Define the URL for the repository tarball
REPO_URL="https://github.com/404mat/setup-mac/archive/refs/heads/main.tar.gz"

# Create a temporary directory for the download and extraction
DOWNLOAD_TEMP_DIR=$(mktemp -d)
if [ -z "$DOWNLOAD_TEMP_DIR" ]; then
    echo "Error: Failed to create temporary directory." >&2
    exit 1
fi

# --- Download and Extract ---
echo "Downloading and extracting dotfiles from the repository..."
# Download the tarball and pipe it directly to tar for extraction
if curl -fsSL "$REPO_URL" | tar -xz -C "$DOWNLOAD_TEMP_DIR" --strip-components=1 "setup-mac-main/dotfiles"; then
    echo "Extraction successful."
else
    echo "Error: Failed to download or extract dotfiles." >&2
    rm -rf "$DOWNLOAD_TEMP_DIR"
    exit 1
fi

# --- Copy to Destination ---
# The extracted files are now in DOWNLOAD_TEMP_DIR.
SOURCE_DIR="$DOWNLOAD_TEMP_DIR"

# Copy the contents of the extracted directory to the destination
# Using rsync to copy dotfiles (files starting with a dot)
echo "Copying dotfiles to '$DEST_DIR'..."
if rsync -av "$SOURCE_DIR"/.* "$DEST_DIR"/; then
    echo "Dotfiles copied successfully."
else
    echo "Error: Failed to copy dotfiles." >&2
    rm -rf "$DOWNLOAD_TEMP_DIR"
    exit 1
fi

# --- Cleanup ---
echo "Cleaning up temporary directory..."
rm -rf "$DOWNLOAD_TEMP_DIR"

echo "Installation of dotfiles completed."
exit 0
