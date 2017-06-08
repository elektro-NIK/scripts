#!/bin/bash

SOURCE="/home/elektronik"
DEST="elektronik@192.168.0.141:/media/elektroNIK_500GB/.backup"

rsync -P --archive --human-readable --partial --update --delete-during --delete-excluded --exclude-from=backup.exclude $SOURCE $DEST

ALL=$(mktemp)
PROG=$(mktemp)
SOUND=$(mktemp)
VIDEO=$(mktemp)

tree -hnRs -o $ALL   --dirsfirst --du $SOURCE
tree -inR  -o $PROG  --dirsfirst      $SOURCE/Programs/
tree -inR  -o $SOUND --dirsfirst      $SOURCE/Sounds/
tree -inR  -o $VIDEO --dirsfirst      $SOURCE/Videos/

sftp $DEST <<EOF
put $ALL   All.txt
put $PROG  Programs.txt
put $SOUND Sounds.txt
put $VIDEO Videos.txt
EOF

rm $ALL
rm $PROG
rm $SOUND
rm $VIDEO

exit
