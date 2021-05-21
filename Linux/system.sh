#!/bin/bash
# Free memory output to a free_mem.txt file
free -h | grep Mem | awk '{print $4}' > ~/backups/freemem/free_mem.txt
# Disk usage output to a disk_usage.txt file
du -ah > ~/backups/diskuse/disk_usage.txt
# List open files to a open_list.txt file
lsof | awk '{print $9}' > ~/backups/openlist/open_list.txt
# Free disk space to a free_disk.txt file 
df -h | grep /dev/sda1 | awk '{print $4}' > ~/backups/freedisk/free_disk.txt

