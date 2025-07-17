#! /usr/bin/env zsh

echo "Starting installation of config files..."

# Define the destination directory on the local machine
DEST_DIR="$HOME/.config"

# Define the URL for the repository tarball
REPO_URL="https://github.com/404mat/setup-mac/archive/refs/heads/main.tar.gz"

# Create a temporary directory for the download and extraction
DOWNLOAD_TEMP_DIR=$(mktemp -d)
if [ -z "$DOWNLOAD_TEMP_DIR" ]; then
    echo "Error: Failed to create temporary directory." >&2
    exit 1
fi

# --- Download and Extract ---
echo "Downloading and extracting config files from the repository..."
# Download the tarball and pipe it directly to tar for extraction
if curl -fsSL "$REPO_URL" | tar -xz -C "$DOWNLOAD_TEMP_DIR" --strip-components=1 "setup-mac-main/config-files"; then
    echo "Extraction successful."
else
    echo "Error: Failed to download or extract config files." >&2
    rm -rf "$DOWNLOAD_TEMP_DIR"
    exit 1
fi

# --- Copy to Destination ---
# The extracted files are now in DOWNLOAD_TEMP_DIR.
# We need to copy the contents of this directory to the destination.
SOURCE_DIR="$DOWNLOAD_TEMP_DIR"

# Ensure the destination directory exists
echo "Ensuring destination directory '$DEST_DIR' exists..."
mkdir -p "$DEST_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create destination directory '$DEST_DIR'." >&2
    rm -rf "$DOWNLOAD_TEMP_DIR"
    exit 1
fi

# Copy the contents of the extracted directory to the destination
# The -a flag is for archive mode (preserves attributes), and -v for verbose
echo "Copying configuration files to '$DEST_DIR'..."
# Use rsync for more robust copying
if rsync -av "$SOURCE_DIR"/ "$DEST_DIR"/; then
    echo "Configuration files copied successfully."
else
    echo "Error: Failed to copy configuration files." >&2
    rm -rf "$DOWNLOAD_TEMP_DIR"
    exit 1
fi

# --- Cleanup ---
echo "Cleaning up temporary directory..."
rm -rf "$DOWNLOAD_TEMP_DIR"

echo "Installation of config files completed."
exit 0
