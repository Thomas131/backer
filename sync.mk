sync_back:
	rsync -a -z --delete --numeric-ids --relative --delete-excluded user@host:/path/to/back/ back.0
	rsync -a -z --delete --numeric-ids --relative --delete-excluded user@host:/secound/path/ back.0
	touch back.0
