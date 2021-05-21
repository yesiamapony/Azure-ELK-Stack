#1/bin/bash
date="$1"
time="$2"
daynight="$3"
casinogame="$4"

#If there is no casino game listed then set to all games
if [ $# -eq 3 ]; then
	casinogame="all"
fi

echo '-------------------------------------------------------------------------------' 
echo 'Syntax: commandname date time am/pm casinogame (casinogame: Blackjack,
Roulette, TexasHoldem)'
echo '-------------------------------------------------------------------------------'
echo ''
echo ''
#Confirm the number of arguments is not less than 3
if [ $# -eq 0 ] || [ $# -eq 1 ] || [ $# -eq 2 ]; then
	echo 'Missing arguments (example syntax: roulette_dealer_finder_by_time_and_game.sh 0315 06:00:00 AM Blackjack)'
	exit 1
fi

if [ $casinogame == 'Blackjack' ]; then
	echo "| Blackjack Dealer |"
	grep -E $time.*$daynight $date'_Dealer_schedule' | awk '{print $1, $2, $3,
	$4}'
fi

if [ $casinogame == 'Roulette' ]; then
	
	echo "| Roulette Dealer |"
	grep -E $time.*$daynight $date'_Dealer_schedule' | awk '{print $1, $2, $5,
	$6}'
fi

if [ $casinogame == 'TexasHoldem' ]; then
	
	echo "| TexasHoldem Dealer |"
	grep -E $time.*$daynight $date'_Dealer_schedule' | awk '{print $1, $2, $7,
	$8}'
fi

if [ $casinogame == 'all' ]; then
	echo "| All Dealers |"
	grep -E $time.*$daynight $date'_Dealer_schedule'
fi

