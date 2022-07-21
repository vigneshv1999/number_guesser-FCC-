#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=postgres -t --no-align -c"
echo "Enter your username:"
read "n"
a1="$($PSQL "select count(*),min(gs_ct) from games where name='$n' group by name")"
if [[ -z $a1 ]]
then
  echo "Welcome, $n! It looks like this is your first time here."
else
  echo "$a1" | while IFS='|' read c m
  do
    echo "Welcome back, $n! You have played $c games, and your best game took $m guesses."
  done
fi
r=$(($RANDOM%1000))
MAIN_MENU(){
  echo "Guess the secret number between 1 and 1000:"
  read g
  if [[ $g =~ [0-9] ]]
  then
    if [[ $g -lt $r ]]
    then
      echo "It's higher than that, guess again:"
      MAIN_MENU $(($1+1)) 
    elif [[ $g -gt $r ]]
    then
      echo "It's lower than that, guess again:"
      MAIN_MENU $(($1+1))
    else
      echo "You guessed it in $1 tries. The secret number was $r. Nice job!"
    fi
  else
    echo "That is not an integer, guess again:"
    MAIN_MENU $1
  fi
}

MAIN_MENU 1