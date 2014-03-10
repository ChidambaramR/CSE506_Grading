#!/bin/sh

cmd='./../xhw1'

s1='script/input/small-1'
s2='script/input/small-2'
s3='script/input/small-3'
s4='script/input/small-4'
s1234='script/input/dup-small-1-2-3-4'

empty='script/input/empty'

l1='script/input/large-1'
l2='script/input/large-2'
l3='script/input/large-3'
l4='script/input/large-4'
l1234='script/input/dup-large-1-2-3-4'

slen=$(stat -c %s input/dup-small-1-2-3-4)
llen=$(stat -c %s input/dup-large-1-2-3-4)

out='script/output'

echo "DESCRIPTION: Testing for O_APPEND. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 6.1.1: Small Files
echo -e "\e[1;36m************Test Case 6.1.1: Small Files***********\e[0m"

set -x
$cmd -a -m 777 "$out/out1" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Bytes: $slen\e[0m"
printf "Checking Output..."

cmp output/out1 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.2: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.2: Small Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 "$out/out2" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Bytes: $slen\e[0m"
printf "Checking Output..."

cmp output/out2 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.3: Empty Files
echo -e "\e[1;36m************Test Case 6.1.3: Empty Files***********\e[0m"

set -x
$cmd -a -m 777 "$out/out3" $empty $empty $empty $empty $empty
set +x

echo -e "\e[1;33mExpected Bytes: 0\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out3)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.4: Large Files
echo -e "\e[1;36m************Test Case 6.1.4: Large Files***********\e[0m"

set -x
$cmd -a -m 777 "$out/out4" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Bytes: $llen\e[0m"
printf "Checking Output..."

cmp output/out4 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.5: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.5: Large Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 "$out/out5" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Bytes: $llen\e[0m"
printf "Checking Output..."

cmp output/out5 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.6: Small Files
echo -e "\e[1;36m************Test Case 6.1.6: Small Files***********\e[0m"

set -x
$cmd -a -m 777 -N "$out/out6" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Files: 4\e[0m"
printf "Checking Output..."

cmp output/out6 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.7: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.7: Small Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -N "$out/out7" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Files: 5\e[0m"
printf "Checking Output..."

cmp output/out7 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.8: Empty Files
echo -e "\e[1;36m************Test Case 6.1.8: Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -N "$out/out8" $empty $empty $empty $empty $empty
set +x

echo -e "\e[1;33mExpected Files: 5\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out8)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.9: Large Files
echo -e "\e[1;36m************Test Case 6.1.9: Large Files***********\e[0m"

set -x
$cmd -a -m 777 -N "$out/out9" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Files: 4\e[0m"
printf "Checking Output..."

cmp output/out9 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.10: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.10: Large Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -N "$out/out10" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Files: 5\e[0m"
printf "Checking Output..."

cmp output/out10 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.11: Small Files
echo -e "\e[1;36m************Test Case 6.1.11: Small Files***********\e[0m"

set -x
$cmd -a -m 777 -P "$out/out11" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out11 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.12: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.12: Small Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -P "$out/out12" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out12 input/dup-small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.13: Empty Files
echo -e "\e[1;36m************Test Case 6.1.13: Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -P "$out/out13" $empty $empty $empty $empty $empty
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out13)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.14: Large Files
echo -e "\e[1;36m************Test Case 6.1.14: Large Files***********\e[0m"

set -x
$cmd -a -m 777 -P "$out/out14" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out14 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6.1.15: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 6.1.15: Large Files & Empty Files***********\e[0m"

set -x
$cmd -a -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out15 input/dup-large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

fi
