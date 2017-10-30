check_backthis:
	#@TODO: Check .backupthis

sync_back:
	rsync -a --delete --numeric-ids --delete-excluded -u -x --password-file=../.pw --stats -h s::etc back.0
	touch back.0
