#! /usr/bin/env zsh

# Define the temporary directory and log file path
TEMP_DIR="/tmp/autosetup_$$" # Add PID for uniqueness in case of parallel runs
LOG_FILE="$TEMP_DIR/log.txt"

# Define the list of scripts to download and execute
# Format: "Name|URL"
scripts=(
    "Dock/Finder config|https://raw.githubusercontent.com/404mat/setup-mac/HEAD/scripts/configure_dock_finder.sh"
    "Dotfiles config|https://raw.githubusercontent.com/404mat/setup-mac/HEAD/scripts/install_dotfiles.sh"
    "Config files installation|https://raw.githubusercontent.com/404mat/setup-mac/HEAD/scripts/install_config_files.sh"
    "Fonts installation|https://raw.githubusercontent.com/404mat/setup-mac/HEAD/scripts/install_fonts.sh"
    "Homebrew packages installation|https://raw.githubusercontent.com/404mat/setup-mac/HEAD/scripts/install_apps.sh"
    # "Invalid URL Script|https://invalid-url-example.com/nonexistent.sh" # Example of a failing download
)
# Array to keep track of failed steps
failed_steps=()
# Overall exit code, assume success initially
overall_exit_code=0

# Create the temporary directory
mkdir -p "$TEMP_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create temporary directory $TEMP_DIR" >&2
    exit 1
fi

# Redirect all stdout and stderr to the log file
# Use >&3 to keep original stdout for final messages
exec 3>&1
exec &> "$LOG_FILE"

echo "Starting autosetup process..."

# --- Install Homebrew ---
echo "----------------------------------------"
echo "Checking for Homebrew..."
echo "----------------------------------------"
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed. Skipping installation."
else
    echo "Homebrew not found. Installing Homebrew..."
    # Run the Homebrew installation script non-interactively
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "Homebrew installed successfully."
        # Attempt to add Homebrew to PATH for the current script session
        # This is needed because subsequent steps rely on brew immediately
        if [[ -x "/opt/homebrew/bin/brew" ]]; then
             # Apple Silicon
             eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -x "/usr/local/bin/brew" ]]; then
             # Intel Macs
             eval "$(/usr/local/bin/brew shellenv)"
        fi
        # Verify brew command is now available
        if ! command -v brew &>/dev/null; then
             echo "Error: brew command not found after installation." >&2
             echo "Please add Homebrew to your ~/.zprofile and relaunch the script." >&2
             exit 1
        fi
    else
        echo "Error: Exiting due to Homebrew installation failure." >&2
        exit 1
    fi
fi
echo "" # Add a newline

# --- Script Execution Loop ---
for item in "${scripts[@]}"; do
    # Split the string by '|'
    IFS='|' read -r name url <<< "$item"

    echo "----------------------------------------"
    echo "Processing Step: $name"
    echo "URL: $url"
    echo "----------------------------------------"

    # Define the path for the downloaded script within the temp directory
    temp_script="$TEMP_DIR/${name// /_}.sh"

    echo "Downloading script..."
    # Download the script using curl
    if curl -fsSL "$url" -o "$temp_script"; then
        echo "Download successful. Making script executable..."
        # Make the downloaded script executable
        chmod +x "$temp_script"

        # Execute the script
        echo "Executing the $name script..."
        "$temp_script"
        script_exit_code=$? # Capture the exit code of the executed script

        if [ $script_exit_code -ne 0 ]; then
            echo "Error: Script '$name' finished with a non-zero exit code: $script_exit_code." >&2
            failed_steps+=("$name (Execution Failed - Exit Code: $script_exit_code)")
            overall_exit_code=1 # Mark overall failure
        else
            echo "Script '$name' executed successfully."
        fi

        # Clean up the temporary script
        echo "Cleaning up temporary file ($temp_script)..."
        echo "Script execution finished for $name."

    else
        echo "Error: Failed to download script '$name' from $url." >&2
        failed_steps+=("$name (Download Failed)")
        overall_exit_code=1 # Mark overall failure
    fi
    echo "" # Add a newline
done

# --- Final Summary ---
echo "========================================"

# Restore original stdout for final user messages
exec 1>&3 3>&-

# Display final status to the user
if [ ${#failed_steps[@]} -ne 0 ]; then
    echo "Installation completed with errors." >&2 # Also log this final status
    echo "Installation completed with errors." >&2 >> "$LOG_FILE"
    echo "The following steps failed:" >&2
    echo "The following steps failed:" >&2 >> "$LOG_FILE"
    for failed_step in "${failed_steps[@]}"; do
        echo "- $failed_step" >&2
        echo "- $failed_step" >&2 >> "$LOG_FILE"
    done
else
    echo "All installation steps completed successfully."
    echo "All installation steps completed successfully." >> "$LOG_FILE"
fi

echo "========================================"
echo "A detailed log of this run is available in the $LOG_FILE file."
echo "The temporary directory used was: $TEMP_DIR"
echo "You can manually delete this directory if needed."
echo "========================================"

# Also add final messages to the log file
echo "========================================" >> "$LOG_FILE"
echo "A detailed log of this run is available in the $LOG_FILE file." >> "$LOG_FILE"
echo "The temporary directory used was: $TEMP_DIR" >> "$LOG_FILE"
echo "You can manually delete this directory if needed." >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"

# Open next steps link in the browser
open "https://github.com/404mat/setup-mac/blob/main/NEXT_STEPS.md"

exit $overall_exit_code
