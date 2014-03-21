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

	# If you come here, it means the system has booted with the students' kernel
	echo "Enter the student's name: "
	read name
	mkdir /home/chid/$name
	
	echo "$(tput setaf 3)"
	echo "===== Writing the kernel config details ====="
	echo "$(tput sgr0)"
	sh kconfig.sh 2>&1 | tee /home/chid/$name/kconfig.txt

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 1 ====="
	echo "$(tput sgr0)"
	sh testcase1_SmallOrEmptyFiles.sh 2>&1 | tee /home/chid/$name/testcase1.txt	
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 2 ====="
	echo "$(tput sgr0)"
	sh testcase2_LargeFiles.sh 2>&1 | tee /home/chid/$name/testcase2.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 6.1 ====="
	echo "$(tput sgr0)"
	sh testcase6_1_APPEND.sh 2>&1 | tee /home/chid/$name/testcase6_1.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 6.2 ====="
	echo "$(tput sgr0)"
	sh testcase6_2_TRUNC.sh 2>&1 | tee /home/chid/$name/testcase6_2.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 6.3 ====="
	echo "$(tput sgr0)"
	sh testcase6_3_EXCL.sh 2>&1 | tee /home/chid/$name/testcase6_3.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 7 ====="
	echo "$(tput sgr0)"
	sh testcase7_appropriateErrno.sh 2>&1 | tee /home/chid/$name/testcase7.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 8 & 9 ====="
	echo "$(tput sgr0)"
	sh testcase8_9_InvalidAddress.sh 2>&1 | tee /home/chid/$name/testcase8_9.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 10 ====="
	echo "$(tput sgr0)"
	sh testcase10_appropriateErrMessage.sh 2>&1 | tee /home/chid/$name/testcase10.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 11 ====="
	echo "$(tput sgr0)"
	sh testcase11_incorrectArguments.sh 2>&1 | tee /home/chid/$name/testcase11.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 12 ====="
	echo "$(tput sgr0)"
	sh testcase12_invalidFlags.sh 2>&1 | tee /home/chid/$name/testcase12.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 13 ====="
	echo "$(tput sgr0)"
	sh testcase13_OutfilePerm.sh 2>&1 | tee /home/chid/$name/testcase13.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 14 ====="
	echo "$(tput sgr0)"
	sh testcase14_FileNoExist.sh 2>&1 | tee /home/chid/$name/testcase14.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 15 ====="
	echo "$(tput sgr0)"
	sh testcase15_inputNoRead.sh 2>&1 | tee /home/chid/$name/testcase15.txt
	printf "\n"

	echo "$(tput setaf 3)"
	echo "===== TEST CASE 16 ====="
	echo "$(tput sgr0)"
	sh testcaseMemLeak.sh 2>&1 | tee /home/chid/$name/testcaseMemLeak.txt
	printf "\n"



	rm -f /home/chid/output/out*
	rm -f /home/chid/error/error3

