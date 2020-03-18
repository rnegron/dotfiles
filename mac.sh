#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running mac.sh..."

# Save to disk (not to iCloud) by default
sudo defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: show all filename extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Remove the auto-hiding Dock delay
sudo defaults write com.apple.dock autohide-delay -float 0

# Automatically hide and show the Dock
sudo defaults write com.apple.dock autohide -bool true

# Display full POSIX path as Finder window title
sudo defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning when changing a file extension
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the “Are you sure you want to open this application?” dialog
sudo defaults write com.apple.LaunchServices LSQuarantine -bool false

# Avoid creating .DS_Store files on network or USB volumes
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
sudo defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Don’t show recent applications in Dock
sudo defaults write com.apple.dock show-recents -bool false

# Disable automatic capitalization
sudo defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
sudo defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
sudo defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Require password immediately after sleep or screen saver begins"
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
sudo defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
sudo defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
sudo defaults write com.apple.screencapture disable-shadow -bool true

# Stop iTunes from responding to the keyboard media keys
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Trackpad: enable tap to click for this user and for the login screen
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable the automatic update check
sudo defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
sudo defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
sudo defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "==> Done!"
