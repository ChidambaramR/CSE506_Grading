#!/bin/sh


###

# TEST CASE: Checks for O_EXCL operation

###


cmd='./../xhw1'

s1='input/small-1'
s2='input/small-2'
s3='input/small-3'
s4='input/small-4'
s1234='input/small-1-2-3-4'

empty='input/empty'

slen=$(stat -c %s input/small-1-2-3-4)

l1='input/large-1'
l2='input/large-2'
l3='input/large-3'
l4='input/large-4'
l1234='input/large-1-2-3-4'

llen=$(stat -c %s input/large-1-2-3-4)
out='output'

echo "DESCRIPTION: Testing for Small or Empty files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 6.3.1: Small Files
echo "************Test Case 6.3.1: Small Files(Output)***********"

 
var=`$cmd -e -c -m 777 "$out/out6.3.1" $s1 $s2 $s3 $s4| egrep -o [0-9]{4}`
 

echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.1 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 6.3.2: Small Files & Empty Files
echo "************Test Case 6.3.2: Small Files & Empty Files(Output)***********"

 
var=`$cmd -e -c -m 777 "$out/out6.3.2" $s1 $s2 $empty $s3 $s4| egrep -o [0-9]{4}`
 
echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.2 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 6.3.3: Empty Files
echo "************Test Case 6.3.3: Empty Files(Output)***********"

 
var=`$cmd -e -c -m 777 "$out/out6.3.3" $empty $empty $empty $empty $empty |  egrep -o [0-9]{1}`
 

echo "Expected Output: 0"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s output/out6.3.3)

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


# Test Case 6.3.4: Small Files
echo "************Test Case 6.3.4: Small Files(Files)***********"

 
var=`$cmd -e -c -m 777 -N "$out/out6.3.4" $s1 $s2 $s3 $s4 |  egrep -o [0-9]{1}`
 

echo "Expected Output: 4"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.4 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 4 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.3.5: Small Files
echo "************Test Case 6.3.5: Small & Empty Files(Files)***********"

 
var=`$cmd -e -c -m 777 -N "$out/out6.3.5" $s1 $s2 $s3 $empty $s4 |  egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.5 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 5 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.3.6: Empty Files
echo "************Test Case 6.3.6: Empty Files(Files)***********"

 
var=`$cmd -e -c -m 777 -N "$out/out6.3.6" $empty $empty $empty $empty $empty |  egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."


result=$(stat -c %s output/out6.3.6)

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


# Test Case 6.3.7: Small Files
echo "************Test Case 6.3.7: Small FIles(Percentage)***********"

 
var=`$cmd -e -c -m 777 -P "$out/out6.3.7" $s1 $s2 $s3 $s4 |  egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.7 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 6.3.8: Small & Empty Files Percentage
echo "************Test Case 6.3.8: Small & Empty Files(Files)***********"

 
var=`$cmd -e -c -m 777 -P "$out/out6.3.8" $s1 $s2 $s3 $empty $s4 |  egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.8 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi



# Test Case 6.3.9: Empty Files
echo "************Test Case 6.3.9: Empty Files(Percentage)**********"

 
var=`$cmd -e -c -m 777 -P "$out/out6.3.9" $empty $empty $empty $empty $empty |  egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s output/out6.3.9)


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


# Test Case 6.3.10: Large Files
echo "************Test Case 6.3.10: Large Files(Bytes)***********"


var=`$cmd -e -c -m 777 "$out/out6.3.10" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{6}`

echo "Expected Output: $llen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.10 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $llen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 6.3.11: Large Files & Empty Files
echo "************Test Case 6.3.11: Large Files & Empty Files(Bytes)***********"


var=`$cmd -e -c -m 777 "$out/out6.3.11" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{6}`



echo "Expected Output: $llen"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.11 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $llen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 6.3.12: Large Files
echo "************Test Case 6.3.12: Large Files(Files)***********"


var=`$cmd -e -c -m 777 -N "$out/out6.3.12" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{1}`


echo "Expected Output: 4"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.12 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 4 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 6.3.13: Large Files & Empty Files
echo "************Test Case 6.3.13: Large Files & Empty Files(Files)***********"


var=`$cmd -e -c -m 777 -N "$out/out6.3.13" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{1}`


echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.13 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 5 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 6.3.14: Large Files
echo "************Test Case 6.3.14: Large Files(Percentage)***********"


var=`$cmd -e -c -m 777 -P "$out/out6.3.14" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{3}`


echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.14 input/large-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi


# Test Case 6.3.15: Large Files & Empty Files
echo "************Test Case 6.3.15: Large Files & Empty Files(Percentage)***********"


var=`$cmd -e -c -m 777 -P "$out/out6.3.15" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{3}`


echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp output/out6.3.15 input/large-1-2-3-4 


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
