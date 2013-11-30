function j -d 'Bookmarking system.'
	set -l jfishdir ~/.jfish

	# Create jfish directory
	if not test -d "$jfishdir"
		if mkdir "$jfishdir"
			echo "Created bookmark directory '$jfishdir'."
		else
			echo "Failed to Create bookmark directory '$jfishdir'."
			return 1
		end
	end

	# Display general usage
	if test (count $argv) -lt 1
		echo 'Usage: go <command> [command arguments]'
		echo 'Where <command> is one of: add, to, remove, list, rename'
		return 1
	end

	# Catch usage errors
	switch $argv[1]
		case add to rm remove
			if not test (count $argv) -ge 2
				echo "Usage: go $argv[1] BOOKMARK"
				return 1
			end

		case mv rename
			if not test (count $argv) -ge 3
				echo "Usage: go $argv[1] SOURCE DEST"
				return 1
			end
	end

	switch $argv[1]
		case add # Add a bookmark
			if test -f "$jfishdir/$argv[2]"
				echo "Error: The bookmark '$argv[2]' already exists."
				echo "Use `go remove '$argv[2]'` to remove it first."
				return 1
			end

			echo "cd \""(pwd)"\"" > "$jfishdir/$argv[2]"

			echo "Added bookmark '$argv[2]'."

		case to # Go to a bookmark
			if test -f "$jfishdir/$argv[2]"
				. "$jfishdir/$argv[2]"
			else
				echo "The bookmark '$argv[2]' does not exist."
				return 1
			end

		case rm remove # Remove a bookmark
			if rm -f "$jfishdir/$argv[2]"
				echo "Removed bookmark '$argv[2]'."
			else
				echo "The bookmark '$argv[2]' does not exist."
				return 1
			end

		case ls list # List all bookmarks
			ls "$jfishdir"

		case mv rename # Rename a bookmark
			if not test -f "$jfishdir/$argv[2]"
				echo "The bookmark '$argv[2]' does not exist."
				return 1
			else if test -f "$jfishdir/$argv[3]"
				echo "Error: The destination bookmark '$argv[3]' already exists."
				echo "Use `go remove '$argv[3]'` to remove it first."
				return 1
			end

			mv "$jfishdir/$argv[2]" "$jfishdir/$argv[3]"

		# Bonus commands!
		case home
			cd

		case fish
			echo "This is no time for games, $USER. Get back to work."

		case '*'
			echo 'Invalid sub-command.'
			echo 'Usage: go <command> [command arguments]'
			echo 'Where <command> is one of: add, to, remove, list, rename'
			return 1
	end
end
