#!/bin/sh

###

# TEST CASE: Testing with invalid flags. 
#	The script script supplies some arbitrary flags to the user program and checks if the program correctly catches it.
#	Secondly, inappropriate combination of flags are specified such as -c and -e when a file exists.
#	Thirdly, the program is run without givng any arguments. In such case, the program should terminate gracefully.
#


###

i1='input/input-1'
i2='input/input-2'
out='/home/chid/output'

echo "DESCRIPTION: Testing for invalid flags. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then

echo "************Test Case 12.1: Checking for appropriate error message on specifying some random flags***********"

var=`./../xhw1 -a -x -y -N "$out/out9" $i1`

echo "Expected Output: Invalid arguments specified"
echo "Received Output: $var"

echo "Has the user handled the test case correctly? Press y/n"
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


echo "************Test Case 12.2: Specify -N and -P and check for conflict message***********"

# Create out15 before testing this.
var=`./../xhw1 -c -N -P "$out/out15" $i1 $i2`

echo "Expected Output: Suitable error message "
echo "Received Output: $var"

echo "Has the user handled the test case correctly? Press y/n"
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
