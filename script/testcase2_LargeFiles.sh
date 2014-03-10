#!/bin/sh

cmd='./../xhw1'

s1='script/input/small-1'
s2='script/input/small-2'
s3='script/input/small-3'
s4='script/input/small-4'
s1234='script/input/small-1-2-3-4'

empty='script/input/empty'

l1='script/input/large-1'
l2='script/input/large-2'
l3='script/input/large-3'
l4='script/input/large-4'
l1234='script/input/large-1-2-3-4'

slen=$(stat -c %s input/small-1-2-3-4)
llen=$(stat -c %s input/large-1-2-3-4)

out='script/output'

echo "DESCRIPTION: Testing for Large files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 2.1: Large Files
echo -e "\e[1;36m************Test Case 2.1: Large Files(Bytes)***********\e[0m"

set -x
$cmd -c -m 777 "$out/out4" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Bytes: $llen\e[0m"
printf "Checking Output..."

cmp output/out4 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2.2: Large Files & Empty Files
echo -e "\e[1;36m************Test Case 2.2: Large Files & Empty Files(Bytes)***********\e[0m"

set -x
$cmd -c -m 777 "$out/out5" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Bytes: $llen\e[0m"
printf "Checking Output..."

cmp output/out5 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2.3: Large Files
echo -e "\e[1;36m************Test Case 2.3: Large Files(Files)***********\e[0m"

set -x
$cmd -c -m 777 -N "$out/out9" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Files: 4\e[0m"
printf "Checking Output..."

cmp output/out9 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2.4: Large Files & Empty Files
echo -e "\e[1;36m************Test Case 2.4: Large Files & Empty Files(Files)***********\e[0m"

set -x
$cmd -c -m 777 -N "$out/out10" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Files: 5\e[0m"
printf "Checking Output..."

cmp output/out10 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2.5: Large Files
echo -e "\e[1;36m************Test Case 2.5: Large Files(Percentage)***********\e[0m"

set -x
$cmd -c -m 777 -P "$out/out14" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out14 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2.6: Large Files & Empty Files
echo -e "\e[1;36m************Test Case 2.6: Large Files & Empty Files(Percentage)***********\e[0m"

set -x
$cmd -c -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out15 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

fi
