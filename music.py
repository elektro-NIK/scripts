#!/usr/bin/env python3

import os
import fnmatch
import subprocess

home = os.environ['HOME']

idir = f'{home}/Sounds'
odir = f'{home}/Converted'

iformats = ['mp3', 'ogg', 'flac']
oformat = 'mp3'
filters = tuple(f'.{i}' for i in iformats)

baud = '160k'
threads = 2
command = f"ffmpeg -y -hide_banner -loglevel panic -i IFILE -threads {threads} -stats -f {oformat} -b:a {baud} OFILE"


for root, dirnames, filenames in os.walk(idir):
    for filename in filenames:
        if filename.lower().endswith(filters):                              # filter music files
            print('Converting ', filename)
            ifile = os.path.join(root, filename)
            ofile = os.path.join(root.replace(idir, odir), filename)
            for iformat in iformats:
                ofile = ofile.replace(iformat, oformat)
            try:
                os.makedirs(os.path.dirname(ofile))                         # create directories
            except FileExistsError:
                pass
            com = command.split()
            com[com.index('IFILE')] = ifile
            com[com.index('OFILE')] = ofile
            process = subprocess.Popen(com, stdout=subprocess.PIPE)         # run process
            output = process.communicate()[0].decode("utf-8")
