#!/bin/sh

cmd=''

s1='./script/input/small-1'
s2='./script/input/small-2'
s3='./script/input/small-3'
s4='./script/input/small-4'
s1234='./script/input/small-1-2-3-4'







# Test Case 1: Small Files
echo -e "\e[1;36m************Test Case 1: Small Files***********\e[0m"

set -x
./../xhw1 -c ./script/output/out-1 ./script/input/small-1 ./script/input/small-2 ./script/input/small-3 ./script/input/small-4
set +x

len=$(($(stat -c %s input/small-1)+$(stat -c %s input/small-2)+$(stat -c %s input/small-3)+$(stat -c %s input/small-4)))

echo -e "\e[1;33mExpected Output: $len\e[0m"
printf "Checking Output..."

cmp output/out-1 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi


# Test Case 2: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 2: Small Files & Empty Files***********\e[0m"

#command="./../xhw1 output/out1 input/small-1 input/small-2"

set -x
./../xhw1 input/small-1 input/small-2 input/empty input/small-3 input/empty input/small-4 > output/out-2
set +x

len=$(($(stat -c %s input/small-1)+$(stat -c %s input/small-2)+$(stat -c %s input/small-3)+$(stat -c %s input/small-4)))

echo -e "\e[1;33mExpected Output: $len\e[0m"
printf "Checking Output..."

cmp output/out-2 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 3: Empty Files
echo -e "\e[1;36m************Test Case 3: Empty Files***********\e[0m"

set -x
 cat input/empty input/empty input/empty > output/out-3
set +x

echo -e "\e[1;33mExpected Output: 0\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out-3)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi



