#1/bin/bash

date="$1"
time="$2"
daynight="$3"

#Confirm the number of arguments is not less than 3
if [ $# -eq 0 ] || [ $# -eq 1 ] || [ $# -eq 2 ]  ; then
	echo "Missing arguments (example syntax: roulette_dealer_finder_by_time.sh 0315 06:00:00 AM)"
	exit 1
fi

grep -E $time.*$daynight $date'_Dealer_schedule' | awk '{print $1, $2, $5, $6}'




