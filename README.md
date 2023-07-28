# auto-backup
A bash script to automatically back up any of the files that have been updated within the past 24 hours in a specific folder
# usage
- This script takes two argument first is the target directory where we will have our original files(which are to be checked for any modifications and backed up if modified ) and the second argument is the destination path where we will put our archived back up files.
- example usage: ``` ./backup.sh /path/to/TargetDir /path/to/DestinationDir``` 
- We can schedule the script to run everyday using crontab.
