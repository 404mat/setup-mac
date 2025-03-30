# If dir does not exist, create it
if [ ! -d ~/Pictures/Screenshots ]; then
    echo "Screenshots directory does not exist, creating ..."
    mkdir ~/Pictures/Screenshots
fi

if [ ! -d "~/Pictures/Simulator Screenshots" ]; then
    echo "Simulator screenshots directory does not exist, creating ..."
    mkdir "~/Pictures/Simulator Screenshots"
fi

# Can do from UI
defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "tilesize" -int "36"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "expose-group-apps" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # search current folder
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
defaults write com.apple.finder "CreateDesktop" -bool "false"

# Cannot do from UI
defaults write com.apple.dock autohide-time-modifier -float "0.15"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "scroll-to-open" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.screencapture "location" -string "~/Pictures/screenshots" # default screenshots folder
defaults write com.apple.iphonesimulator "ScreenShotSaveLocation" -string "~/Pictures/Simulator Screenshots" # default simulator screenshots folder
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# Restart Dock and Finder
killall Dock && killall SystemUIServer && killall Finder
