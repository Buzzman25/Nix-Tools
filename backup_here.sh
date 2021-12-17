#!/bin/sh
# set backup directory and make if it does not exist
bkupname="backups"
bkup=$HOME/$bkupname
mkdir -p $bkup
# set date and convert current path to safe filename
now=`date +%Y-%m-%d_%H.%M.%S`
folder=`pwd | cut -d'/' -f3- | sed 's/\//_/g'`
# if in user folder skip backup, if not backup all
if [ $USER == $folder ]
then
  tar --exclude=./$bkupname -czf $bkup/${now}_${folder}.tar.gz .
else
  tar -czf $bkup/${now}_${folder}.tar.gz .
fi