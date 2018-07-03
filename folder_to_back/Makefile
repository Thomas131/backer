all: pre_backup hook_before_back check_backthis prepare_back lock sync_back rotate_backs hook_after_back prepare_next_back unlock

manual_unlock:
	rm -f pending
	rm -f .lock

pre_backup:
	echo "$(shell date)"

prepare_back:
#	if [ -d pending ]; then rm -rf pending; fi
	if [ ! -d pending ]; then if [ -d back.0 ]; then cp -alf back.0 pending; else mkdir pending; fi; fi

prepare_next_back:
#	if [ -d pending ]; then rm -rf pending; fi
	if [ ! -d pending ]; then if [ -d back.0 ]; then cp -alf back.0 pending; else mkdir pending; fi; fi

lock:
#	if [ -f .lock ]; then echo -n "Backup is locked ... is there already a backup running?"; exit 1; else touch .lock; fi

rotate_backs:
	if [ -d back.2 ]; then rm -rf back.2; fi
	if [ -d back.1 ]; then mv back.1 back.2; fi
	if [ -d back.0 ]; then mv back.0 back.1; fi
	if [ -d pending ]; then mv pending back.0; fi

unlock:
	rm -f .lock

include sync.mk

