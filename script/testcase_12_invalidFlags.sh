#!/bin/sh

echo "************Test Case 12: Invalid flags***********"

echo "DESCRIPTION: Testing for invalid files. Press y to continue, n to skip this test case"

read abc

if [ "$abc" = "y" ]; then
var=`./../xhw1 -a -x -y -N "$out/out9" $l1234 | grep -i "invalid\|error\|flags\|supported\|wrong\|please\|try"`

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
else
	echo "Test case skipped"
fi
