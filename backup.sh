#!/bin/sh

DEST="/Volumes/SANDISK/$(hostname)"

echo 'Starting backup..' &&
  echo "Finding and running git push" &&
    find ~/Develop -maxdepth 3 -mindepth 1 -type d | while read -r dir; do
      if [ -d "$dir/.git" ]; then
        remote_url=$(git -C "$dir" config --get remote.origin.url)
        if [[ "$remote_url" == /Volumes/* ]]; then
          echo "Pushing $dir (Remote: $remote_url)"
          git -C "$dir" push mypassport
        fi
      fi
    done &&
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
