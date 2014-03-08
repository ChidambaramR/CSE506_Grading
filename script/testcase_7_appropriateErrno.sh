#!/bin/sh
errno=10

s1='sample.txt'
s2='hello.txt'

echo "DESCRIPTION: Testing for appropriate error numbers. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
# Test Case 1: Checking for error number 
# We have to write separate test case for each errorno we are expecting. 
# i.e If we are giving open without create flag and it will return ERRNO as 10, then 
#`	we need to copy paste this and check for that errorno instead of the dummy 45 being used here
echo "************Test Case 7.1: Checking for appropriate error number***********"

var=`./../xhw1 -c -m 777 $s1 $s2 | grep errno | egrep -o [0-9]{2}`

echo "Error Number written"
echo "Expected Output: $errno"
echo "Received Output: $var"

if [ "x$var" = "x" ]; then
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
else
        if [ $var == 45 ]; then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
        else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
        fi
fi
else
	echo "Test case skipped"
fi
