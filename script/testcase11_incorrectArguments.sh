#!/bin/sh
errno=10

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

#No input or output files specified
echo "************Test Case 11.1: No input or output files specified***********"

var1=`./../xhw1`

echo "Expected Output: Some error message"
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

echo "************Test Case 11.2: No input file***********"
var=`./../xhw1 -c -m 777 "$out/error1"`

echo "Expected Output: Error message saying no input files"
echo "Received Output: $var"
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

echo "************Test Case 11.3: No input or output files specified but flags are given***********"
var1=`./../xhw1 -a -m 777`

echo "Expected Output: Some error message"
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
