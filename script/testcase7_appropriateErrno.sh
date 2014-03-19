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
# Test Case 1: Checking for error number 
# We have to write separate test case for each errorno we are expecting. 
# i.e If we are giving open without create flag and it will return ERRNO as 10, then 
#`	we need to copy paste this and check for that errorno instead of the dummy 45 being used here

#Output file does not have write permission
echo "************Test Case 7.1: Output file does not have write permission (EACCES 13)***********"

var1=`./../xhw1 -a -m 444 "$out/error1" $s11 $s12 $s13`

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

echo "************Test Case 7.2: Output file already exists but -c and -e flag is given (EEXIST 17)***********"

# Create error1 file before testing this
var=`./../xhw1 -c -e 777 "$out/error1" $s11 $s12 $s13`

echo "Expected Output: EEXIST 17"
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

echo "************Test Case 7.3: Outputfile does not exist but -c flag is not given (ENOENT 2)***********"

# Dont Create error3 file before testing this
var1=`./../xhw1 -a -m 777  "$out/error2" $s11 $s12 $s13`

echo "Expected Output: ENOENT 2"
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


#Input file does not have read permission
echo "************Test Case 7.4: Input file does not have read permission (EACCES 13)***********"

var1=`./../xhw1 -c -a "$out/error3" $s1 $s2 $s3`
#var=`./../xhw1 -a -m 777 "$out/error1" $s1 $s2 $s3 | grep errno\|error\|fail\|failed\|errors\|please\|returned | egrep -o [0-9]{2}`

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
