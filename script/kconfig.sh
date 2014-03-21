#!/bin/sh

	var=`grep -v \# ./../kernel.config|grep \= |wc -l`
	echo "Total number of configuration lines except comments = "$var
	var=`ls -lh /boot/vmlinuz-3.2.2+`
	echo "Total size of the binary = "$var
