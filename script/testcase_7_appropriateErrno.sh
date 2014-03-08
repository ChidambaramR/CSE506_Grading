#!/bin/sh
errno=10

s1='sample.txt'
s2='hello.txt'

# Test Case 1: Checking for error number 
# We have to write separate test case for each errorno we are expecting. 
# i.e If we are giving open without create flag and it will return ERRNO as 10, then 
#`	we need to copy paste this and check for that errorno instead of the dummy 45 being used here
echo -e "\e[1;36m************Test Case : Checking for appropriate error number***********\e[0m"

var=`./xhw1 -c -m 777 $s1 $s2 | grep errno | egrep -o [0-9]{2}`

echo -e "\e[1;33mExpected Output: Errno = $errno\e[0m"
printf "Checking Output..."

if [ "x$var" = "x" ]; then
        echo "Word empty"
else
        echo "Word = "+$var
        if [ $var == 45 ]; then
                echo "Errno matched"
        else
                echo "Errno did not match"
        fi
        echo "Word Not empty"
fi

