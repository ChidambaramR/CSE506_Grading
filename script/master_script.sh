#!/bin/sh

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
