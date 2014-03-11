#!/bin/sh


####

# TEST CASE: INPUT FILE DOES NOT EXISTS
# All the input files specifies does not exist. The script greps the output for common error displays and 
#	asks permission from the grader whether the user has displayed appropriate error messages and aborted
#	the executiong of the system call. 

####

echo "DESCRIPTION: Checking if the users have checked for invalid address space being passed to the system call. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
echo "************Test Case 8_9: Checking if user is handling correctly when invalid address is used***********"

var=`grep "copy_from_user\|access_ok\|getname" ./../sys_xconcat.c`



echo "Expected Output: Usage of copy_from_user / access_ok / getname or something similar"
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
