#!/bin/sh
errno=10

s1='script/input/small-1'
s2='script/input/small-2'
s3='script/input/small-3'
out='script/output/error'

echo "DESCRIPTION: Testing for appropriate error numbers. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
# Test Case 1: Checking for error number 
# We have to write separate test case for each errorno we are expecting. 
# i.e If we are giving open without create flag and it will return ERRNO as 10, then 
#`	we need to copy paste this and check for that errorno instead of the dummy 45 being used here
echo "************Test Case 7.1: Checking for appropriate error number (EACCES 13)***********"

var=`./../xhw1 -a "$out/error1" $s1 $s2 $s3 | grep errno\|error\|fail\|failed\|errors\|please\|returned | egrep -o [0-9]{2}`

echo "Expected Output: $errno"
echo "Received Output: $var"

if [ "x$var" = "x" ]; then
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
else
        if [ $var == 13 ]; then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
        else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
        fi
fi



echo "************Test Case 7.1: Checking for appropriate error number (EEXIST 17)***********"

# Create error1 file before testing this
var=`./../xhw1 -c -e "$out/error1" $s1 $s2 $s3 | grep errno\|error\|fail\|failed\|errors\|please\|returned | egrep -o [0-9]{2}`

echo "Expected Output: $errno"
echo "Received Output: $var"

if [ "x$var" = "x" ]; then
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
else
        if [ $var == 17 ]; then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
        else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
        fi
fi



echo "************Test Case 7.2: Checking for appropriate error number (ENOENT 2)***********"

# Dont Create error3 file before testing this
var=`./../xhw1 -a "$out/error3" $s1 $s2 $s3 | grep errno\|error\|fail\|failed\|errors\|please\|returned | egrep -o [0-9]{1}`

echo "Expected Output: $errno"
echo "Received Output: $var"

if [ "x$var" = "x" ]; then
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
else
        if [ $var == 2 ]; then
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
