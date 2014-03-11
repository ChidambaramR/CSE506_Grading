#!/bin/sh


####

# TEST CASE: INVALID ADDRESS SPACE
# The student must check for invalid address space being passed to the system call. Following are the functions which does the job
#	copy_from_user, access_ok, verify_area, getname
#	So the script greps for the users source file to check if they have used some of these functions

####

echo "DESCRIPTION: Checking if the users have checked for invalid address space being passed to the system call. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
echo "************Test Case 8_9: Checking if user is handling correctly when invalid address is used***********"

var=`grep "copy_from_user\|access_ok\|getname\|verify_area" ./../sys_xconcat.c`



echo "Expected Output: Usage of copy_from_user / access_ok / getname / verify_area or something similar"
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
