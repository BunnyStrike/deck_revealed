#!/bin/bash

mkdir -p "$HOME/.local/share/Steam/steamui/overrides/movies"
cd "$HOME/.local/share/Steam/steamui/overrides/movies"

title="Select Your Video"
prompt="Pick an option:"
options=("Futuramma" "Office" "Pipboy" "Seinfeld")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 
    case "$REPLY" in
    1) wget "https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/futurama/deck_startup.webm"; break;;
    2) wget "https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/office/deck_startup.webm"; break;;
    3) wget "https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/pipboy/deck_startup.webm"; break;;
    4) wget "https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/seinfeld/deck_startup.webm"; break;;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done

# while opt=$(zenity --title="$title" --text="$prompt" --list \
#                    --column="Options" "${options[@]}")
# do
#     case "$opt" in
#     "${options[0]}") zenity --info --text="You picked $opt, option 1";;
#     "${options[1]}") zenity --info --text="You picked $opt, option 2";;
#     "${options[2]}") zenity --info --text="You picked $opt, option 3";;
#     "${options[3]}") zenity --info --text="You picked $opt, option 4";;
#     *) zenity --error --text="Invalid option. Try another one.";;
#     esac
# done