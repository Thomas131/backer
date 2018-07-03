hook_before_back:

check_backthis:
	#@TODO: Check .backupthis

sync_back:
	time rsync -a --no-specials --no-devices --delete --numeric-ids --delete-excluded -u -x --password-file=../.passwordfile --stats -h hostname::folder_to_back pending #in this case a rsync deamon ... faster because no encryption ... use just at home!
	touch pending

hook_after_back:

