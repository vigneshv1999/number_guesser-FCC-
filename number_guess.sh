#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=postgres --no-align --tuples-only -c"
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
