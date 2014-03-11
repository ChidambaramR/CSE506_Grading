#!/bin/sh

###

# MASTER SCRIPT. CAUTION. ANY CHANGE HERE WILL AFFECT THE ENTIRE WORKING. BEWARE WHILE MODIFYING

# 	It assumes that the .config file is present in the user directory. 
#	It does the following. 
#		1. Make clean
#		2. Make
#		3. Make modules_install
#		4. Make install
#	Once done, it collects the kernel config statistics of the user

#	Now the person should reboot the machine and hopefully the kernel should boot.

#	Then when the master script is executed again, give "n" so that it will start executing all the sub scripts
###

jump () {
	cd ./../
	make clean &
	wait
	make &
	wait
	make modules_install &
	wait
	make install &
	wait
	var=`grep -v \# kernel.config|grep \= |wc -l`
	echo "Total number of configuration lines except comments = "$var
	var=`ls -lh /boot/vmlinuz-3.2.2+`
	echo "Total size of the binary = "$var
}

echo "HI!!! Welcome. Do you want to perform make?"
read abc

if [ "$abc" = "y" ]; then
	jump
else
	# If you come here, it means the system has booted with the students' kernel
	echo "$(tput setaf 3)"
	echo "===== TEST CASE 2 ====="
	echo "$(tput sgr0)"
	sh ./testcase_2_largeFiles.sh
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 7 ====="
	echo "$(tput sgr0)"
	sh ./testcase_7_appropriateErrno.sh
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 12 ====="
	echo "$(tput sgr0)"
	sh ./testcase_12_invalidFlags.sh
	printf "\n"

fi
