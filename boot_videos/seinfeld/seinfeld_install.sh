#!binbash

cd "$HOME/Downloads"
mkdir -p seinfeld_boot_video
cd "$HOME/Downloads/seinfeld_boot_video"
wget https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/seinfeld_install/deck_startup.webm
wget https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/library.css
curl -o - https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/install_boot_screen.sh | bash -
curl -o - https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/fix_full_screen.sh | bash -
cd "$HOME/Downloads"
rm -r seinfeld_boot_video