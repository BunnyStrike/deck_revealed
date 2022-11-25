#!binbash

cp "$HOME/.local/share/Steam/steamui/css/library.css" "$HOME/.local/share/Steam/steamui/css/library.css.original"
# cp "./library.css" "$HOME/.local/share/Steam/steamui/css/library.css"
# echo 'video{flex-grow:1;width:100%; height:100%; z-index:10}' >> "$HOME/.local/share/Steam/steamui/css/library.css"
sed -i 's/video{flex-grow:0;width:300px;height:300px;z-index:10}/video{flex-grow:1;width:100%; height:100%; z-index:10}/g' "$HOME/.local/share/Steam/steamui/css/library.css"
# Add automatic size detection if file size has changed
size="$(wc -c <"$HOME/.local/share/Steam/steamui/css/library.css")"
# Still need to truncate, otherwise when steam starts up, it will be replaced
truncate -s $size "$HOME/.local/share/Steam/steamui/css/library.css"
# truncate -r "$HOME/.local/share/Steam/steamui/css/library.css.original" "$HOME/.local/share/Steam/steamui/css/library.css"
