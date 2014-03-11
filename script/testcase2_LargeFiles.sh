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
echo "************Test Case 2.1: Large Files(Bytes)***********"


var=`$cmd -c -m 777 "$out/out10" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{6}`

echo "Expected Output: $llen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out10 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $llen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 2.2: Large Files & Empty Files
echo "************Test Case 2.2: Large Files & Empty Files(Bytes)***********"


var=`$cmd -c -m 777 "$out/out11" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{6}`



echo "Expected Output: $llen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out11 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $llen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 2.3: Large Files
echo "************Test Case 2.3: Large Files(Files)***********"


var=`$cmd -c -m 777 -N "$out/out12" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{1}`


echo "Expected Output: 4"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out12 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 4 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 2.4: Large Files & Empty Files
echo "************Test Case 2.4: Large Files & Empty Files(Files)***********"


var=`$cmd -c -m 777 -N "$out/out13" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{1}`


echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out13 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 5 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 2.5: Large Files
echo "************Test Case 2.5: Large Files(Percentage)***********"


var=`$cmd -c -m 777 -P "$out/out14" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{3}`


echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out14 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 2.6: Large Files & Empty Files
echo "************Test Case 2.6: Large Files & Empty Files(Percentage)***********"


var=`$cmd -c -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{3}`


echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out15 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


fi
