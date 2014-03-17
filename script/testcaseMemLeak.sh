#!/bin/sh


####

# TEST CASE: INPUT FILE DOES NOT EXISTS
# All the input files specifies does not exist. The script greps the output for common error displays and 
#	asks permission from the grader whether the user has displayed appropriate error messages and aborted
#	the executiong of the system call. 

####

errno=10

s1='input/small-1'
s2='input/small-2'
s3='input/small-3'
s4='input/small-4'
out='output/error'

echo "DESCRIPTION: Checking for memory leak. Press y to continue and n to stop"

read abc

if [ "$abc" = "y" ]; then
echo "************Test Case X: Input file does not exists***********"

var=`valgrind --tool=memcheck --leak-check=full -v ./../xhw1 -a -c "$out/error15" $s1 $s2 $s3 $s4`

echo "Expected Output: 0 output "
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
