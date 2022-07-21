#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=postgres --no-align --tuples-only -c"
echo "Enter your username:"
read n
echo "Hello $n"