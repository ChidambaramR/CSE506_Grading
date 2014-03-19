#!/bin/sh


###

# TEST CASE: Checks for proper operation with input files being small or empty.
#	The script assumes files small-1, small-2, small-3, small-4, small-1-2-3-4, 
#	already created in the backend. It supplies as inputs the small-1, small-2, small-3, small-4,
#	across various test cases. It checks for correctness with the output file created by the user which is in the 
#	output directory, with the file small-1-2-3-4 across several 
#	test cases. If equal the test case is assumed to passed , else fail.

###


cmd='./../xhw1'

s1='input/small-1'
s2='input/small-2'
s3='input/small-3'
s4='input/small-4'
s1234='input/small-1-2-3-4'

empty='input/empty'

slen=$(stat -c %s input/small-1-2-3-4)

outpath="/home/chid/output"

echo "DESCRIPTION: Testing for Small or Empty files. Press y to continue, n to skip this test case"
read abc
if [ "$abc" = "y" ]; then

# Test Case 1.1: Small Files
echo "************Test Case 1.1: Small Files(Output)***********"

 
var=`$cmd -c -m 777 "$outpath/out1" $s1 $s2 $s3 $s4| egrep -o [0-9]{4}`
 

echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out1 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 1.2: Small Files & Empty Files
echo "************Test Case 1.2: Small Files & Empty Files(Output)***********"

 
var=`$cmd -c -m 777 "$outpath/out2" $s1 $s2 $empty $s3 $s4| egrep -o [0-9]{4}`
 
echo "Expected Output: $slen"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out2 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq $slen ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi

# Test Case 1.3: Empty Files
echo "************Test Case 1.3: Empty Files(Output)***********"

 
var=`$cmd -c -m 777 "$outpath/out3" $empty $empty $empty $empty $empty |  egrep -o [0-9]{1}`
 

echo "Expected Output: 0"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s $outpath/out3)

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


# Test Case 1.4: Small Files
echo "************Test Case 1.4: Small Files(Files)***********"

 
var=`$cmd -c -m 777 -N "$outpath/out4" $s1 $s2 $s3 $s4 |  egrep -o [0-9]{1}`
 

echo "Expected Output: 4"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out4 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 4 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 1.5: Small Files
echo "************Test Case 1.5: Small & Empty Files(Files)***********"

 
var=`$cmd -c -m 777 -N "$outpath/out5" $s1 $s2 $s3 $empty $s4 |  egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out5 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 5 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 1.6: Empty Files
echo "************Test Case 1.6: Empty Files(Files)***********"

 
var=`$cmd -c -m 777 -N "$outpath/out6" $empty $empty $empty $empty $empty |  egrep -o [0-9]{1}`
 

echo "Expected Output: 5"
echo "Received Output: $var"
printf "Checking Output..."


result=$(stat -c %s $outpath/out6)

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


# Test Case 1.7: Small Files
echo "************Test Case 1.7: Small FIles(Percentage)***********"

 
var=`$cmd -c -m 777 -P "$outpath/out7" $s1 $s2 $s3 $s4 |  egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out7 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi




# Test Case 1.8: Small & Empty Files Percentage
echo "************Test Case 1.8: Small & Empty Files(Files)***********"

 
var=`$cmd -c -m 777 -P "$outpath/out8" $s1 $s2 $s3 $empty $s4 |  egrep -o [0-9]{3}`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

cmp $outpath/out8 input/small-1-2-3-4 


if [ $? -eq 0 ] && [ ${var:-0} -eq 100 ];  then
	echo "$(tput setaf 2)"
	echo "***PASSED***"
	echo "$(tput sgr0)"
	
else
	echo "$(tput setaf 1)"
	echo "***FAILED***"
	echo "$(tput sgr0)"
fi



# Test Case 1.9: Empty Files
echo "************Test Case 1.9: Empty Files(Percentage)**********"

 
var=`$cmd -c -m 777 -P "$outpath/out9" $empty $empty $empty $empty $empty`
 

echo "Expected Output: 100"
echo "Received Output: $var"
printf "Checking Output..."

result=$(stat -c %s $outpath/out9)


if [ ${result:-0} -eq 0 ];
	then
		echo "$(tput setaf 2)"
		echo "***PASSED***"
		echo "$(tput sgr0)"
	else
		echo "$(tput setaf 1)"
		echo "***FAILED***"
		echo "$(tput sgr0)"
fi

fi
