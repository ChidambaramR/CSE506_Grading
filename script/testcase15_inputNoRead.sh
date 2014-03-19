#!/bin/sh

s1='input/small-1-noperm'
s2='input/small-2-noperm'
s3='input/small-3-noperm'


s11='input/small-1'
s12='input/small-2'
s13='input/small-3'


out='/home/chid/output/error'

echo "DESCRIPTION: Testing for appropriate error numbers. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then

#Input file does not have read permission
echo "************Test Case 15.1: Input file does not have read permission (EACCES 13)***********"

var1=`./../xhw1 -c -a "$out/error3" $s1 $s2 $s3`

echo "Expected Output: EACCESS 13"
echo "Received Output: $var1"
printf "Checking Output...\n"

echo "Has the user given the error messages correctly?"
read abc

if [ "$abc" = "y" ]; then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


else
	echo "Test case skipped"
fi
