check_backthis:
	#@TODO: Check .backupthis

sync_back:
	time rsync -a --delete --numeric-ids --delete-excluded -u -x --password-file=../.passwordfile --stats -h hostname::folder_to_back back.0 #in this case a rsync deamon ... faster because no encryption ... use just at home!
	touch back.0
