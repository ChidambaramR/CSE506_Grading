#!/bin/sh

###

# TEST CASE: Checks for proper operation with input files being small or empty.
#	The script assumes files large-1, large-2, large-3, large-4, large-1-2-3-4, 
#	already created in the backend. It supplies as inputs the large-1, large-2, large-3, large-4,
#	across various test cases. It checks for correctness with the output file created by the user which is in the 
#	output directory, with the file large-1-2-3-4 across several 
#	test cases. If equal the test case is assumed to passed , else fail.

###

cmd='./../xhw1'

empty='input/empty'

l1='input/large-1'
l2='input/large-2'
l3='input/large-3'
l4='input/large-4'
l1234='input/large-1-2-3-4'

llen=$(stat -c %s input/large-1-2-3-4)

out='output'

echo "DESCRIPTION: Testing for Large files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 2.1: Large Files
echo "************Test Case 2.1: Large Files(Bytes)***********"


var=`$cmd -c -m 777 "$out/out10" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{6}`

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


var=`$cmd -c -m 777 "$out/out11" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{6}`



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


var=`$cmd -c -m 777 -N "$out/out12" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{1}`


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


var=`$cmd -c -m 777 -N "$out/out13" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{1}`


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


var=`$cmd -c -m 777 -P "$out/out14" $l1 $l2 $l3 $l4 |  egrep -o [0-9]{3}`


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


var=`$cmd -c -m 777 -P "$out/out15" $l1 $l2 $empty $l3 $l4 |  egrep -o [0-9]{3}`


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
