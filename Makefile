all: lock check_backthis rotate_backs sync_back unlock delete_old_back
lock:
	echo "@TODO: lock"

check_backthis:
	echo "@TODO: check, if the folder is the right one (.backupthis)"

rotate_backs:
	if [ -d back.2 ]; then mv back.2 "_delete.$(shell date -I'seconds')"; fi
	if [ -d back.1 ]; then mv back.1 back.2; fi
	if [ -d back.0 ]; then cp -al back.0 back.1; else mkdir back.0; fi

unlock:
	echo "remove lockfile";

delete_old_back:
	rm -rf _delete.*

include sync.mk

