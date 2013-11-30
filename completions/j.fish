set -l jfishdir ~/.jfish

complete -c j -n '__fish_use_subcommand' -x -a add -d 'Adds a bookmark'
complete -c j -n '__fish_use_subcommand' -x -a to -d 'Goes to a bookmark'
complete -c j -n '__fish_use_subcommand' -x -a "rm remove" -d 'Removes a bookmark'
complete -c j -n '__fish_use_subcommand' -x -a "ls list" -d 'Lists all bookmarks'
complete -c j -n '__fish_use_subcommand' -x -a "mv rename" -d 'Renames a bookmark'

for i in add to rm remove mv rename
	complete -c j -n "contains '$i' (commandline -poc)" -x -a "(ls -1 '$jfishdir')" -d 'Bookmark'
end
