all: pre_backup check_backthis lock prepare_back sync_back rotate_backs unlock

pre_backup:
	echo "$(shell date)"

prepare_back:
	if [ -d pending ]; then rm -rf pending; fi
	if [ -d back.0 ]; then cp -alf back.0 pending; else mkdir pending; fi

lock:
	if [ -f .lock ]; then echo -n "Backup is locked ... is there already a backup running?"; exit 1; else touch .lock; fi

rotate_backs:
	if [ -d back.2 ]; then rm -rf back.2; fi
	if [ -d back.1 ]; then mv back.1 back.2; fi
	if [ -d back.0 ]; then mv back.0 back.1; fi
	if [ -d pending ]; then mv pending back.0; fi

unlock:
	rm -f .lock

include sync.mk

