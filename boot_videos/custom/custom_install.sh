#!binbash

# wget https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/library.css
curl -o - https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/install_boot_screen.sh | bash -
curl -o - https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/fix_full_screen.sh | bash -
# 1840847 might need to change after updates 
truncate -s 1840847 "$HOME/.local/share/Steam/steamui/movies/deck_startup.webm"
