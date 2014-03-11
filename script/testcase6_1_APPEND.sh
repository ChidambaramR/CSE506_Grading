#!/bin/sh


###

# TEST CASE: Checks for O_APPEND operation

###


cmd='./../xhw1'

s1='script/input/small-1'
s2='script/input/small-2'
s3='script/input/small-3'
s4='script/input/small-4'
s1234='script/input/dup-small-1-2-3-4'

empty='script/input/empty'

slen=$(stat -c %s input/dup-small-1-2-3-4)

l1='script/input/large-1'
l2='script/input/large-2'
l3='script/input/large-3'
l4='script/input/large-4'
l1234='script/input/large-1-2-3-4'

llen=$(stat -c %s input/large-1-2-3-4)
out='script/output'

echo "DESCRIPTION: Testing for Small or Empty files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 6.1.1: Small Files
echo "************Test Case 6.1.1: Small Files(Output)***********"

 
var=`$cmd -a -m 777 "$out/out1" $s1 $s2 $s3 $s4| grep returned|egrep -o [0-9]{4}`
 

echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out1 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 6.1.2: Small Files & Empty Files
echo "************Test Case 6.1.2: Small Files & Empty Files(Output)***********"

 
var=`$cmd -a -m 777 "$out/out2" $s1 $s2 $empty $s3 $s4| grep returned|egrep -o [0-9]{4}`
 
echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out2 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 6.1.3: Empty Files
echo "************Test Case 6.1.3: Empty Files(Output)***********"

 
var=`$cmd -a -m 777 "$out/out3" $empty $empty $empty $empty $empty | grep returned | egrep -o [0-9]{1}`
 

echo "Expected Output: 0"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s output/out3)

if [ ${result:-0} -eq 0 ] && [ ${var:-0} -eq 0 ];
	then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
	else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
fi


# Test Case 6.1.4: Small Files
echo "************Test Case 6.1.4: Small Files(Files)***********"

 
var=`$cmd -a -m 777 -N "$out/out4" $s1 $s2 $s3 $s4 | grep returned | egrep -o [0-9]{1}`
 

echo "Expected Output: 4"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out4 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 4 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.1.5: Small Files
echo "************Test Case 6.1.5: Small & Empty Files(Files)***********"

 
var=`$cmd -a -m 777 -N "$out/out5" $s1 $s2 $s3 $empty $s4 | grep returned | egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out5 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 5 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.1.6: Empty Files
echo "************Test Case 6.1.6: Empty Files(Files)***********"

 
var=`$cmd -a -m 777 -N "$out/out6" $empty $empty $empty $empty $empty | grep returned | egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."


result=$(stat -c %s output/out6)

if [ ${result:-0} -eq 0 ] && [ ${var:-0} -eq 5 ];
	then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
	else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
fi


# Test Case 6.1.7: Small Files
echo "************Test Case 6.1.7: Small FIles(Percentage)***********"

 
var=`$cmd -a -m 777 -P "$out/out7" $s1 $s2 $s3 $s4 | grep returned | egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out7 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.1.8: Small & Empty Files Percentage
echo "************Test Case 6.1.8: Small & Empty Files(Files)***********"

 
var=`$cmd -a -m 777 -P "$out/out8" $s1 $s2 $s3 $empty $s4 | grep returned | egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out8 input/dup-small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi



# Test Case 6.1.9: Empty Files
echo "************Test Case 6.1.9: Empty Files(Percentage)**********"

 
var=`$cmd -a -m 777 -P "$out/out9" $empty $empty $empty $empty $empty | grep returned | egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s output/out9)


if [ ${result:-0} -eq 0 ] && [ ${var:-0} -eq 100 ];
	then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
	else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
fi


# Test Case 6.1.10: Large Files
echo "************Test Case 6.1.10: Large Files(Bytes)***********"


var=`$cmd -a -m 777 "$out/out10" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{6}`

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


# Test Case 6.1.11: Large Files & Empty Files
echo "************Test Case 6.1.11: Large Files & Empty Files(Bytes)***********"


var=`$cmd -a -m 777 "$out/out11" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{6}`



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


# Test Case 6.1.12: Large Files
echo "************Test Case 6.1.12: Large Files(Files)***********"


var=`$cmd -a -m 777 -N "$out/out12" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{1}`


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

# Test Case 6.1.13: Large Files & Empty Files
echo "************Test Case 6.1.13: Large Files & Empty Files(Files)***********"


var=`$cmd -a -m 777 -N "$out/out13" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{1}`


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


# Test Case 6.1.14: Large Files
echo "************Test Case 6.1.14: Large Files(Percentage)***********"


var=`$cmd -a -m 777 -P "$out/out14" $l1 $l2 $l3 $l4 | grep returned | egrep -o [0-9]{3}`


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


# Test Case 6.1.15: Large Files & Empty Files
echo "************Test Case 6.1.15: Large Files & Empty Files(Percentage)***********"


var=`$cmd -a -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4 | grep returned | egrep -o [0-9]{3}`


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
