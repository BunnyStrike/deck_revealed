#!binbash

# Removes the new way of seting up custom boot videos
rm "$HOME/.local/share/Steam/steamui/overrides/movies/deck_startup.webm"

# Removes the old way of seting up custom boot videos 
rm "$HOME/.local/share/Steam/steamui/overrides/movies/deck_startup.webm"
cp "$HOME/.local/share/Steam/steamui/css/library.css.original" "$HOME/.local/share/Steam/steamui/css/library.css" 
cp "$HOME/.local/share/Steam/steamui/movies/deck_startup.webm.original" "$HOME/.local/share/Steam/steamui/movies/deck_startup.webm" 