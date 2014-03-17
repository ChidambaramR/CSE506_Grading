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
out='output'

echo "DESCRIPTION: Testing for Appropriate error messages. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then

echo "************Test Case 10.1: Checking for appropriate error message for same input and output file***********"

var=`./../xhw1 -a -m 777 $i1 $i1`

echo "Expected Output: Input and outputs are same"
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


echo "************Test Case 10.2: Checking for appropriate error message for same input and output file***********"

var=`./../xhw1 -c -m 7 "$out/out19" $i1 $i2`
var1=`ll "$out/out19"`

echo "Expected Output: Same permission file as that of output file"
echo "Received Output: $var1"

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
