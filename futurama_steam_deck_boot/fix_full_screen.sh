#!binbash

cp "$HOME/.local/share/Steam/steamui/css/library.css" "$HOME/.local/share/Steam/steamui/css/library.css.original"
cp "./library.css" "$HOME/.local/share/Steam/steamui/css/library.css"
# echo 'video{flex-grow:1;width:100%; height:100%; z-index:10}' >> "$HOME/.local/share/Steam/steamui/css/library.css"
truncate -r "$HOME/.local/share/Steam/steamui/css/library.css.original" "$HOME/.local/share/Steam/steamui/css/library.css"