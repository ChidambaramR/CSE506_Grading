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


echo "DESCRIPTION: Testing for Small or Empty files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 1.1: Small Files
echo -e "\e[1;36m************Test Case 1.1: Small Files(Bytes)***********\e[0m"

set -x
$cmd -c -m 777 "$out/out1" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Bytes: $slen\e[0m"
printf "Checking Output..."

cmp output/out1 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 1.2: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 1.2: Small Files & Empty Files(Bytes)***********\e[0m"

set -x
$cmd -c -m 777 "$out/out2" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Bytes: $slen\e[0m"
printf "Checking Output..."

cmp output/out2 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 1.3: Empty Files
echo -e "\e[1;36m************Test Case 1.3: Empty Files(Bytes)***********\e[0m"

set -x
$cmd -c -m 777 "$out/out3" $empty $empty $empty $empty $empty
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


# Test Case 1.4: Small Files
echo -e "\e[1;36m************Test Case 1.4: Small Files(Files)***********\e[0m"

set -x
$cmd -c -m 777 -N "$out/out6" $s1 $s2 $s3 $s4
set +x

echo -e "\e[1;33mExpected Files: 4\e[0m"
printf "Checking Output..."

cmp output/out6 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 1.5: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 1.5: Small Files & Empty Files(Files)***********\e[0m"

set -x
$cmd -c -m 777 -N "$out/out7" $s1 $s2 $empty $s3 $s4
set +x

echo -e "\e[1;33mExpected Files: 5\e[0m"
printf "Checking Output..."

cmp output/out7 input/small-1-2-3-4 

if [ $? -eq 0 ]
	then
		echo -e "\e[1;32mPASSED\e[0m"
	else
		echo -e "\e[1;31mFAILED\e[0m"
fi

# Test Case 1.6: Empty Files
echo -e "\e[1;36m************Test Case 1.6: Empty Files(Files)***********\e[0m"

set -x
$cmd -c -m 777 -N "$out/out8" $empty $empty $empty $empty $empty
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


# Test Case 1.7: Small Files
echo -e "\e[1;36m************Test Case 1.7: Small Files(Percentage)***********\e[0m"

set -x
$cmd -c -m 777 -P "$out/out11" $s1 $s2 $s3 $s4
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

# Test Case 1.8: Small Files & Empty Files
echo -e "\e[1;36m************Test Case 1.8: Small Files & Empty Files*(Percentage)**********\e[0m"

set -x
$cmd -c -m 777 -P "$out/out12" $s1 $s2 $empty $s3 $s4
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

# Test Case 1.9: Empty Files
echo -e "\e[1;36m************Test Case 1.9: Empty Files*(Percentage)**********\e[0m"

set -x
$cmd -c -m 777 -P "$out/out13" $empty $empty $empty $empty $empty
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

fi
