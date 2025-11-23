#!/bin/sh

echo 'Starting backup..' &&
    rsync -avh --delete ~/Desktop /Volumes/SANDISK/Mac/umairashraf &&
    rsync -avh --delete ~/Documents /Volumes/SANDISK/Mac/umairashraf &&
    rsync -avh --delete ~/Downloads /Volumes/SANDISK/Mac/umairashraf &&
    rsync -avh --delete --exclude 'mamiride/expo' ~/Develop /Volumes/SANDISK/Mac/umairashraf &&
    rsync -avh --delete ~/Pictures /Volumes/SANDISK/Mac/umairashraf &&
    rsync -avh --delete root@umairgroup.com:/home/user-data/backup/encrypted /Volumes/SANDISK/Mac/umairashraf/Backups/mail.uraan.xyz &&
    rsync -avh --delete root@umairgroup.com:/home/user-data/backup/secret_key.txt /Volumes/SANDISK/Mac/umairashraf/Backups/mail.uraan.xyz &&
    echo 'Backup funished successfully';
