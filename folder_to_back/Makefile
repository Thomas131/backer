all: pre_backup check_backthis lock rotate_backs sync_back unlock delete_old_back

pre_backup:
	echo "$(shell date)"
lock:
	if [ -f .lock ]; then echo -n "Backup is locked ... is there already a backup running?"; exit 1; else touch .lock; fi

rotate_backs:
	if [ -d back.2 ]; then mv back.2 "_delete.$(shell date -I'seconds')"; fi
	if [ -d back.1 ]; then mv back.1 back.2; fi
	if [ -d back.0 ]; then cp -al back.0 back.1; else mkdir back.0; fi

unlock:
	rm -f .lock

delete_old_back:
	rm -rf _delete.*

include sync.mk

