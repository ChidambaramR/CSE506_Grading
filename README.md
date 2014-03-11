CSE506_Grading
==============

Contains files relating to grading CSE506 course at Stony Brook University

Following is the working of the script. 

There is a master script which drives the entire process. The person has to initially run the master script.
1. It first cleans the binaries, builds the 3.2.2 kernel using the configuration file of the student. 
2. If the kernel is successfully built, the statistics about the configuration files are collected and recorded in the students grade sheet.
3. Then the system has to be rebooted.
4. Once the system is up, we have to again run the master script and this time, give "n" for the question asked by the script. 
5. When "n" is give, it starts executing all the sub scripts. 
6. Each scripts corresponds to a test case in the grading sheets. Each script has several test cases in it and it outputs the resule of each 
	test case which are recorded in the student's grade sheet.
7. When all the scripts are done executing, the script ends and the comments are recorded.
