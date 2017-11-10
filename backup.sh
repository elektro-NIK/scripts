#!/bin/bash

SOURCE=$HOME
DEST=""
TEMPDIR=$HOME/.temp-backup

# checking argument
if [ "$1" ]
  then
    DEST=$1
fi

rsync -ahu --info=progress2 --partial --delete-during --delete-excluded --exclude-from=backup.exclude $SOURCE $DEST

mkdir $TEMPDIR

ALL=$(mktemp --tmpdir=$TEMPDIR)
PROG=$(mktemp --tmpdir=$TEMPDIR)
SOUND=$(mktemp --tmpdir=$TEMPDIR)
VIDEO=$(mktemp --tmpdir=$TEMPDIR)

tree -hnRs -o $ALL   --dirsfirst --du $SOURCE
tree -inR  -o $PROG  --dirsfirst      $SOURCE/Programs/
tree -inR  -o $SOUND --dirsfirst      $SOURCE/Sounds/
tree -inR  -o $VIDEO --dirsfirst      $SOURCE/Videos/

# upload temp files
sftp $DEST <<EOF
put $ALL   All.txt
put $PROG  Programs.txt
put $SOUND Sounds.txt
put $VIDEO Videos.txt
EOF

rm -r $TEMPDIR

exit
