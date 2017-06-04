#!/bin/bash
##### START #####
if test -e /media/elektronik/elektroNIK_500GB/.backup/
then
  rsync                                         \
    --archive                                   \
    --human-readable                            \
    -PW                                         \
    --update                                    \
    --delete-after                              \
    --delete-excluded                           \
    --exclude=.*                                \
    --exclude=*.vdi                             \
    --exclude=*.avi                             \
    --exclude=*.mkv                             \
    --exclude=*.torrent                         \
    --exclude=*.iso                             \
    ~                                           \
    /media/elektronik/elektroNIK_500GB/.backup
else
  echo "Не підключено жорсткий диск!"
  exit
fi
if test -e /usr/bin/tree
then
  tree -hnRs -o /media/elektronik/elektroNIK_500GB/.backup/All.txt        --dirsfirst --du ~
  tree -inR  -o /media/elektronik/elektroNIK_500GB/.backup/Soundslist.txt --dirsfirst      ~/Sounds/
  tree -inR  -o /media/elektronik/elektroNIK_500GB/.backup/Videoslist.txt --dirsfirst      ~/Videos/
  tree -inR  -o /media/elektronik/elektroNIK_500GB/.backup/Driverlist.txt --dirsfirst      ~/Programs/Drivers/
  tree -inR  -o /media/elektronik/elektroNIK_500GB/.backup/OSlist.txt     --dirsfirst      ~/Programs/OS/
  tree -inR  -o /media/elektronik/elektroNIK_500GB/.backup/Softlist.txt   --dirsfirst      ~/Programs/Soft/
else
  echo "Не встановлено tree"
  #kdialog --title "Помилка!" --error "tree не встановлено! \nРезервне копіювання скасовано!"
exit
fi
echo " "
echo "###ГОТОВО###"
exit
