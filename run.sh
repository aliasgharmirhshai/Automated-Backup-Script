#!/bin/bash

backup_dir=$(cat config.json | jq -r '.BackupDir')
Backup_dest=$(cat config.json | jq -r '.BackupDest')

function start_backup {
    echo "Hello"
}

function cheak_config {
    # Cheak Dir
    if [ ! -d "$backup_dir" ]; then 
        mkdir "$backup_dir"
    fi
    
    # Cheak External Disk
    if lsblk | grep -q "$Backup_dest"; then 
       start_backup
    else
        echo "Disk is Not Found" 
    fi
}



cheak_config "$backup_dir $Backup_dest"