#!/bin/bash


# Kill DeckRevealed if it is running
killall -9 -q deck_revealed_app || :
kill $(pgrep -f /home/deck/Applications/DeckRevealed.AppImage) || :

# Remove Directory for Applications
rm -f ~/Applications/DeckRevealed.AppImage
