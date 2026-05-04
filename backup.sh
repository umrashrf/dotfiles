#!/bin/sh

DEST="/Volumes/SANDISK/$(hostname)"

echo 'Starting backup..' &&
    rsync -avh --delete ~/Desktop "$DEST" &&
    rsync -avh --delete ~/Documents "$DEST" &&
    rsync -avh --remove-source-files ~/Downloads "$DEST" &&
    rsync -avh --delete \
            --exclude 'Projects/project1' \
            --exclude 'Projects/project2' \
            --exclude 'client1' \
        ~/Develop "$DEST" &&
    rsync -avh --delete ~/Pictures "$DEST" &&
    rsync -avh --delete $USER@mywebsite.com:/home/$USER/projects/ "$DEST/Backups/mywebsite.com" &&
    rsync -avh --delete $USER@umairgroup.com:/home/$USER/clients/ "$DEST/Backups/mywebsite.com" &&
    echo 'Backup funished successfully';
