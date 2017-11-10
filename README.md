Backer:
=======
This is my personal Backup-System based on Makefiles (This will maybe change in the future). It is highly inspired by rsnapshot. It is designed to be:
* flexible (all changes should be made in sync.mk, but if really neccecary, they can be made in the Makefile itself, too.
* consistend (independing of the backup-command, the Make-Commands are the same)
* easy (to use and from concept; all the magic is normally done in rsync)
* space-saving (Only modified files are saved twice)

Usage:
======
The main reason to provide this is to give some hints how I do backups. This isn't meant to be used without modifications.

I copy this repo for every Device I want to backup. Then I copy the folder folder_to_backup to every folder I want to backup (and delete the sample-folder). Now I modify the sync.mk-Command as wanted. Now I can do ```make``` in every subdirectory to backup this dir. I can also do make in the upper directory to backup every folder. This can be done by a cronjob.

Makefiles:
==========
Why did I use Makefiles?

* First of all, I can just execute single functions without having to do additional work
* The next reason was that it automatically skips on errors. This is wanted sometimes, but on the other hand I don't want that other times, too.

TODO:
=====
* support back.{Number}.tar.{xz|bz|gz}
* support Special Chars in Makefile
* unlock backup on abort
* [example]: check for .backupthis-file on destination directory before backup to make sure the connection to the destination works
* make output less verbose on success
