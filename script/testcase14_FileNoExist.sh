#!/bin/sh


####

# TEST CASE: INPUT FILE DOES NOT EXISTS
# All the input files specifies does not exist. The script greps the output for common error displays and 
#	asks permission from the grader whether the user has displayed appropriate error messages and aborted
#	the executiong of the system call. 

####

errno=10

s1='script/input/werwe-1'
s2='script/input/sdfsdf-2'
s3='script/input/sdasdasdasdasdasdasxasxasxasxd-3'
s4='script/input/i23-1'
s5='script/input/inpu234234-2'
s6='script/input/input234234-3'
out='script/output/error'

echo "DESCRIPTION: Testing if user is able to write eventhough he does not have permission. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
echo "************Test Case 12.1: Checking if user is handling correctly when input files does not exist***********"

var=`./../xhw1 -a -c "$out/error5" $s1 $s2 $s3 $s4 | grep errno\|error\|fail\|failed\|errors\|please\|returned `



echo "Expected Output: Input file does not exists or something similar"
echo "Received Output: $var"
printf "Checking Output..."

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
