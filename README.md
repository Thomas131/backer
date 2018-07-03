moved:
======
This Project is moved to [GitLab](https://gitlab.com/Thomas131/backer)!

Backer:
=======
This is my personal Backup-System based on Makefiles (This will maybe change in the future). It is highly inspired by rsnapshot. My goals were:
* flexible (all changes should be made in sync.mk, but if really neccecary, they can be made in the Makefile itself, too)
* consistend (independing of the backup-command behind the scenes, the Make-Commands are the same)
* easy (to use and from concept; all the magic is normally done in rsync)
* fast&space-saving (Only new and modified files are synced and saved twice; thanks to hardlinking and the rsync-check algorithm)
* The backed up device should have no access to delete backups (Backups are pulled by the Backup-Server instead of pushed to the Backup-Server; Thanks to my webhoster [uberspace.de] for giving the tip somewhere on their blog)
* If possible, the Backer should only have read-only-access (This was solved by using an rsync-daemon on the devices to backup, configured to allow just read-only Access)

Usage:
======
The main reason to provide this is to give some hints how I do backups. This isn't meant to be used without modifications.

I copy this repo for every Device I want to backup. Then I copy the folder folder_to_backup to every folder I want to backup (and delete the sample-folder). Now I modify the sync.mk-Command as wanted. Now I can do ```make``` in every subdirectory to backup this dir. I can also do make in the upper directory to backup every folder. This can be done by a cronjob.

rsync-Flags (from the example):
===============================
* -a: archive-Mode ... a lot of options combined
* --no-specials --no-devices: Skip device-files and special files
* --delete: Delete files from the old Backups if deleted from the backed folder
* --numeric-ids: Save nummeric Owner-IDs, even though the matching user doesn't exist on the destination device
* --delete-excluded: Delete files on the backup-folder, if they already exist there and are excluded by the exclude-command
* -u: TODO
* -x: Stay on the same Filesystem; Don't backup mounted sub-solders
* --password-file=../.passwordfile: There is the Password-File with the password of the Rsync-Daemon
* --stats -h: Display Stats after a sync (how many files changes, how much bandwidth transmitted, ... in human readable units)
//TODO: Fake-root

For additional params or explaination in more detail read the rsync-Manpage.

Makefiles:
==========
Why did I use Makefiles?

* First of all, I can just execute single functions without having to do additional work
* The next reason was that it automatically skips on errors. This is wanted sometimes, but on the other hand I don't want that other times, too.

rsync-Daemon:
=============
The rsync-Daemon was chosen because:
* It was possible to provide read-only access to all files
* It is faster than rsync over ssh for the lack of encryption (only use in controlled networks!!!)

It also has some downsides:
* The files are not encrypted and I am unsure of the quality of the authentification. Only the backer should be allowed to access the files. (The Request-IPs can be restricted but that is no big obstacle if the hacker in controll of the network)
* rsync as daemon isn't used as widely as ssh and there are maybe unknown security flaws (although the NSA seems to have ways to get ssh-access, too ;( )

TODO:
=====
* support back.{Number}.tar.{xz|bz|gz}
* support Special Chars in Makefile
* unlock backup on abort
* [example]: check for .backupthis-file on destination directory before backup to make sure the connection to the destination works
* make output less verbose on success
