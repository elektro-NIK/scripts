#!/bin/bash

SOURCE="/home/elektronik"
DEST="elektronik@192.168.0.141:/media/elektroNIK_500GB/.backup"

rsync -P --archive --human-readable --partial --update --delete-during --delete-excluded --exclude-from=backup.exclude $SOURCE $DEST

# tree -hnRs -o $DEST/All.txt        --dirsfirst --du ~
# tree -inR  -o $DEST/Soundslist.txt --dirsfirst      ~/Sounds/
# tree -inR  -o $DEST/Videoslist.txt --dirsfirst      ~/Videos/
# tree -inR  -o $DEST/Driverlist.txt --dirsfirst      ~/Programs/Drivers/
# tree -inR  -o $DEST/OSlist.txt     --dirsfirst      ~/Programs/OS/
# tree -inR  -o $DEST/Softlist.txt   --dirsfirst      ~/Programs/Soft/
exit
