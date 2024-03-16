#!/bin/bash

<<check
this file is for if elif else conditional statements
check
#read -p "Enter number1" num1
#read -p "Enter number2" num2

function calculate(){
if [[ $1 == $2 ]];
then 
	echo "Both the numbers are equal"
elif [[ $1 -ge $2 ]];
then 
	echo "$1 is greater than $2"
else 
	echo "$1 is smaller than $2"
fi
}
calculate "2" "5"
