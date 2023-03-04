#!/bin/bash

set -eo pipefail

DECK_REVEALED_GITHUB_URL="https://api.github.com/repos/BunnyStrike/deck_revealed/releases/latest"
DECK_REVEALED_URL="$(curl -s ${DECK_REVEALED_GITHUB_URL} | grep -E 'browser_download_url.*AppImage' | cut -d '"' -f 4)"

APP_IMAGE_LAUNCHER_URL="https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage"

report_error() {
    FAILURE="$(caller): ${BASH_COMMAND}"
    echo "Something went wrong!"
    echo "Error at ${FAILURE}"
}

trap report_error ERR

# Kill DeckRevealed if it is running
killall -9 -q deck_revealed_app || :
kill $(pgrep -f /home/deck/Applications/DeckRevealed.AppImage)

# Installs Chrome and allows controller support
flatpak install --system -y com.google.Chrome
flatpak --user override --filesystem=/run/udev:ro com.google.Chrome

# Download and install DeckRevealed
curl -L "${DECK_REVEALED_URL}" -o ~/Applications/DeckRevealed.AppImage 2>&1 | stdbuf -oL tr '\r' '\n' | sed -u 's/^ *\([0-9][0-9]*\).*\( [0-9].*$\)/\1\n#Download Speed\:\2/' | zenity --progress --title "Downloading DeckRevealed App" --width 600 --auto-close --no-cancel 2>/dev/null
chmod +x ~/Applications/DeckRevealed.AppImage
~/Applications/DeckRevealed.AppImage
