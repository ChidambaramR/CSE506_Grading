#!/bin/sh

cmd='./../xhw1'

l1='input/large-1'
l2='input/large-2'
l3='input/large-3'
l4='input/large-4'
l1234='input/large-1-2-3-4'
nofiles=4
percent=100
llen=$(stat -c %s input/large-1-2-3-4)

green='\e[0;32m'
red='\e[0;31m'
nc='\e[0m'

read abc
# Test Case 1: Large Files with NUMBER OF BYTES
echo "************Test Case 2.1: Large Files expecting number of bytes written***********"

var=`./../xhw1 -c -N "$out/out9" $l1234 | grep returned | egrep -o [0-9]{6}`

echo "Number of bytes written"
echo "Expected output: $llen"
echo "Received output: $var"

if [ ${var:-0} -eq $llen ]; then
	echo "$(tput setaf 2)"
	echo "$(tput sgr0)"
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 2: Large Files with NUMBER OF FILES
echo  "************Test Case 2.2: Large Files expecting number of files written***********"

var=`./../xhw1 -c -N "$out/out9" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{2}`

echo "Number of files written"
echo "Expected output: 4"
echo "Received output: $var"


if [ ${var:-0} -eq $nofiles ]; then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 3: Large Files with NUMBER OF FILES
echo "************Test Case 2.3: Large Files expecting percentage of bytes written***********"

var=`./../xhw1 -c -P "$out/out9" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{3}`

echo -e "\e[1;36mExpected output: Percentage of bytes written = 100\e[0m"

echo "Percentage of bytes written"
echo "Expected output: 100"
echo "Received output: $var"

if [ ${var:-0} -eq $percent ]; then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi
