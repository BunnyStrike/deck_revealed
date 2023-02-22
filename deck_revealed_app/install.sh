#!/bin/bash

set -eo pipefail

# EMUDECK_GITHUB_URL="https://api.github.com/repos/EmuDeck/emudeck-electron/releases/latest"
DECK_REVEALED_GITHUB_URL="https://api.github.com/repos/BunnyStrike/deck_revealed/releases/latest"
DECK_REVEALED_URL="$(curl -s ${DECK_REVEALED_GITHUB_URL} | grep -E 'browser_download_url.*AppImage' | cut -d '"' -f 4)"

APP_IMAGE_LAUNCHER_URL="https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage"

report_error() {
    FAILURE="$(caller): ${BASH_COMMAND}"
    echo "Something went wrong!"
    echo "Error at ${FAILURE}"
}

trap report_error ERR

# Make Directory for Applications
mkdir -p ~/Applications

# Download and install app image launcher so Steam can run appimages from shortucts
curl -L "${APP_IMAGE_LAUNCHER_URL}" -o ~/Downloads/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage 2>&1 | stdbuf -oL tr '\r' '\n' | sed -u 's/^ *\([0-9][0-9]*\).*\( [0-9].*$\)/\1\n#Download Speed\:\2/' | zenity --progress --title "Downloading App Image Launcher" --width 600 --auto-close --no-cancel 2>/dev/null
chmod +x ~/Downloads/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage
~/Downloads/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage install || :

# Download and install DeckRevealed
curl -L "${DECK_REVEALED_URL}" -o ~/Applications/EmuDeck.AppImage 2>&1 | stdbuf -oL tr '\r' '\n' | sed -u 's/^ *\([0-9][0-9]*\).*\( [0-9].*$\)/\1\n#Download Speed\:\2/' | zenity --progress --title "Downloading DeckRevealed App" --width 600 --auto-close --no-cancel 2>/dev/null
chmod +x ~/Applications/DeckRevealed.AppImage
~/Applications/DeckRevealed.AppImage
