#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi


targetDirectory=$1
destinationDirectory=$2


echo "The target directory is $1"
echo "The destination directory is $2"

#defining the current timestamp.
currentTS=`date +%s`

#setting the backup file names 
backupFileName="backup-[$currentTS].tar.gz"


#define current dir as original dir
origAbsPath=`pwd`

# Going into the target directory
cd $destinationDirectory
destDirAbsPath=`pwd`


cd $origAbsPath  
cd $targetDirectory

#defining timestamp of 24 hrs ago
yesterdayTS=$((currentTS - 24 * 60 * 60))

declare -a toBackup

#for each file in the folder check if the file is changed in last 24 hrs, if yes then add filename to toBackup list.
for file in $(ls) 
do
  
  if ((`date -r $file +%s` > $yesterdayTS ))
  then
    
    toBackup+=($file)
  fi
done

#archieve all the files in the list.
tar -czvf $backupFileName ${toBackup[@]}

# Move the backup file to the destination directory
mv $backupFileName $destDirAbsPath




