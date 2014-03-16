#!/bin/sh

###

# TEST CASE: User does not have permissions to read some of the input files. In this case,
#	he has to correctly read from those files which he has permission to read from and ignore other files.
#	The script supplies some files with no read permission and greps for the number of bytes written by the user. 
#	There is a backend file which is already created names error-small-1-2-3-4. The size of this file is 60 bytes.
#	This size is compared with the size of the output file created by the user. Ideally it should also be 60.
#	The script checks for equality and decides on whether the test case has passed or not. 


###


slen=$(stat -c %s input/error-small-1-2-3-4)
errno=10

s1='script/input/noperm-1'
s2='script/input/noperm-2'
s3='script/input/noperm-3'
s4='script/input/input-1'
s5='script/input/input-2'
s6='script/input/input-3'
out='script/output/error'

echo "DESCRIPTION: Testing if user is able to write eventhough he does not have permission. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
echo "************Test Case 14.1: Checking if user is correctly reading when he does not have permission to read input files***********"

var=`./../xhw1 -a -c "$out/error5" $s4 $s5 $s6 $s1 $s2 $s3 | grep errno\|error\|fail\|failed\|errors\|please\|returned | egrep -o [0-9]{2}`



echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/error/error5 input/error-small-1-2-3 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
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
