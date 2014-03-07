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


# Test Case 1: Small Files
echo -e "\e[1;36m************Test Case 1: Small Files***********\e[0m"

set -x
$cmd -t -m 777 "$out/out1" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Output: $slen\e[0m"
printf "Checking Output..."

cmp output/out1 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 2: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 2: Small Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 "$out/out2" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Output: $slen\e[0m"
printf "Checking Output..."

cmp output/out2 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 3: Empty Files
echo -e "\e[1;36m************Test Case 3: Empty Files***********\e[0m"

set -x
$cmd -t -m 777 "$out/out3" $empty $empty $empty $empty $empty
set +x

echo -e "\e[1;33mExpected Output: 0\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out3)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 4: Large Files
echo -e "\e[1;36m************Test Case 4: Large Files***********\e[0m"

set -x
$cmd -t -m 777 "$out/out4" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Output: $llen\e[0m"
printf "Checking Output..."

cmp output/out4 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 5: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 5: Large Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 "$out/out5" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Output: $llen\e[0m"
printf "Checking Output..."

cmp output/out5 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 6: Small Files
echo -e "\e[1;36m************Test Case 6: Small Files***********\e[0m"

set -x
$cmd -t -m 777 -N "$out/out6" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Output: 4\e[0m"
printf "Checking Output..."

cmp output/out6 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 7: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 7: Small Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -N "$out/out7" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Output: 5\e[0m"
printf "Checking Output..."

cmp output/out7 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 8: Empty Files
echo -e "\e[1;36m************Test Case 8: Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -N "$out/out8" $empty $empty $empty $empty $empty
set +x

echo -e "\e[1;33mExpected Output: 5\e[0m"
printf "Checking Output..."

result=$(stat -c %s output/out8)

if [ $result == 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 9: Large Files
echo -e "\e[1;36m************Test Case 9: Large Files***********\e[0m"

set -x
$cmd -t -m 777 -N "$out/out9" $l1 $l2 $l3 $l4
set +x

echo -e "\e[1;33mExpected Output: 4\e[0m"
printf "Checking Output..."

cmp output/out9 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 10: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 10: Large Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -N "$out/out10" $l1 $l2 $empty $l3 $l4
set +x

echo -e "\e[1;33mExpected Output: 5\e[0m"
printf "Checking Output..."

cmp output/out10 input/large-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 11: Small Files
echo -e "\e[1;36m************Test Case 11: Small Files***********\e[0m"

set -x
$cmd -t -m 777 -P "$out/out11" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out11 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 12: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 12: Small Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -P "$out/out12" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Percentage\e[0m"
printf "Checking Output..."

cmp output/out12 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 13: Empty Files
echo -e "\e[1;36m************Test Case 13: Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -P "$out/out13" $empty $empty $empty $empty $empty
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

# Test Case 14: Large Files
echo -e "\e[1;36m************Test Case 14: Large Files***********\e[0m"

set -x
$cmd -t -m 777 -P "$out/out14" $l1 $l2 $l3 $l4
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

# Test Case 15: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 15: Large Files & Empty Files***********\e[0m"

set -x
$cmd -t -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4
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
