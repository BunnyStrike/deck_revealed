#!binbash

cd "$HOME/Downloads"
mkdir -p futurama_boot_video
cd /futurama_boot_video
wget https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/futurama/deck_startup.webm
wget https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/library.css
curl https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/install_boot_screen.sh > install_boot_screen.sh | bash -
curl https://raw.githubusercontent.com/BunnyStrike/deck_revealed/main/boot_videos/fix_full_screen.sh > fix_full_screen.sh | bash -
cd /..
rm -r futurama_boot_video