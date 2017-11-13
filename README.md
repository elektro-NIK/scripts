# Scripts
Collection of scripts in Bash and Python

## Depending:
- backup.sh: `tree`, `sftp`
- HDR.sh: `darktable-cli`, `hugin`
- music.py: `python3`, `ffmpeg`

## Using:
- backup.sh - simple backup with exclude list:
  - `./backup.sh` - backup from SOURCE to DEST (variables in script)
  - `./backup.sh user@host:/mnt/` - backup from SOURCE to remote file system user@host:/mnt/
- HDR.sh - simple HDR creating from RAW (.CR2):
  - `cp <files> <dir>`- locate *.CR2 files in directory
  - `cp HDR.sh HDR.xmp <dir>` - copy script files to directory
  - `./HDR.sh` - run script
- music.py - script for recode music:
  - `./music.py` - recode music from idir to odir with baudrate (baud)
