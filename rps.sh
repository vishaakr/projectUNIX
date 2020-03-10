#!/bin/bash
echo "******* |WELCOME TO ROCK PAPER SCISSORS | *******"
echo "Do you know how to play rock, paper, scissors? (y|n)"
read instruct
if [ "$instruct" == "n" ]; then
	echo "Read the instructions."
	open https://www.wrpsa.com/the-official-rules-of-rock-paper-scissors/
else
	echo "Great!"
fi
echo "Would you like to play? Press y!"
read input1
if [ "$input1" == "y" ]; then
	echo "Let's play!"
elif [ "$input1" == "Y" ]; then
	echo "Let's play!"
else 
	echo "That's too bad :("
	exit -1
fi
echo "Enter a username: "
read username
wins=0
losses=0
rounds=0
tie=0
while [ "$input1" == "y" ]
do
	echo "Hi, $username. Choose "r" for rock, "p" for paper, "s" for scissor."
	read rps
	com=$[RANDOM%3+1]
	case "$rps" in
		"r")
			if [ "$com" == "3" ]; then
				echo "The computer chose scissor. You win."
				wins=$(($wins + 1))
			elif [ "$com" == "2" ]; then
				echo "The computer chose paper. You lose."
				losses=$(($losses+1))
			else
				echo "You both picked rock. It's a tie"
			fi
			;;
		"p")
			if [ "$com" == "3" ]; then
                        	echo "The computer chose scissor. You lose."
				losses=$(($losses+1))
                	elif [ "$com" == "1" ]; then
                        	echo "The computer chose rock. You win."
				wins=$((wins + 1))
                	else
                        	echo "You both picked paper. It's a tie"
			fi
			;;
		"s")
			if [ "$com" == "2" ]; then
                        	echo "The computer chose paper. You win."
				wins=$(($wins + 1))
                	elif [ "$com" == "1" ]; then
                        	echo "The computer chose rock. You lose."
				losses=$(($losses+1))
                	else
                        	echo "You both picked scissor. It's a tie"
			fi
			;;
		*)
			echo "Next time enter lowercase r, p, or s"
			;;
	esac
	rounds=$((rounds+1))
	echo "Would you like to play again? Press y."
	read input1
done
echo "******* | GAME OVER | *******"
echo "$username won $wins out of $rounds rounds against the computer."
echo ""
echo ""
echo "Here is the scoreboard:"
echo ""
d=$(date)
echo "| $username: $wins wins $losses losses $rounds rounds  $d |" >> scoreboard.txt
cat scoreboard.txt 
echo ""
echo ""




