# scripts
Collection of scripts in Bash and Python

- backup.sh - simple backup with exclude list:
  - `./backup.sh` - backup from SOURCE to DEST (variables in script)
  - `./backup.sh user@host:/mnt/` - backup from SOURCE to remote file system user@host:/mnt/
- HDR.sh - simple HDR creating from RAW (.CR2):
  - `cp <files> <dir>`- locate *.CR2 files in directory
  - `cp HDR.sh HDR.xmp <dir>` - copy script files to directory
  - `./HDR.sh` - run script
