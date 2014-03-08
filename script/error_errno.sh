#!/bin/sh

cmd='./a.out'
errno=10

# Test Case 1: Small Files
echo -e "\e[1;36m************Test Case 1: Small Files***********\e[0m"

var=`./xhw1 -c -m 777 $s1 $s2 $s3 $s4 | egrep -o [0-9]{2}`

echo -e "\e[1;33mExpected Output: Errno = $errno\e[0m"
printf "Checking Output..."

if [ "x$var" = "x" ]; then
	echo "Word empty"
else
	echo "Word Not empty"
fi

