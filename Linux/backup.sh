#!/bin/sh

tar cvf /var/backup/home.tar /home
mv /var/backup/home.tar /var/backup/home.11122020.tar
ls -lah /var/backup > /var/backup/file_report.txt
free -gt > /var/backup/disk_report.txt
