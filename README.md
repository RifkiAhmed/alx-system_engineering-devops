#Describion of what each script is doing in this project



	pwd : prints the absolute path name of the current working directory
	
	ls  : Display the contents list of your current directory
	
	cd ~: Changes the working directory to the user’s home directory
	
	ls -l : Display current directory contents in a long format
	
	ls -a : Display current directory contents, including hidden files
	
	ls -lan : Display current directory contents. Long format. with user and group IDs displayed numerically, And hidden files
	
	mkdir /tmp/my_first_directory : Creates a directory named my_first_directory in the /tmp/ directory
			
	mv /tmp/betty /tmp/my_first_directory/ : Move the file betty from /tmp/ to /tmp/my_first_directory
			
	rm /tmp/my_first_directory/betty : Delete the file betty.The file betty is in /tmp/my_first_director
			
	rm -r /tmp/my_first_directory : Delete the directory my_first_directory that is in the /tmp directory
			
	cd - : Changes the working directory to the previous one
	
	ls -la . .. /boot : Lists all files in the current directory and the parent of the working directory and the /boot directory
			
	file /tmp/iamafile : Prints the type of the file named iamafile. The file iamafile will be in the /tmp directory
			
	ln -s /bin/ls __ls__ : Create a symbolic link to /bin/ls, named __ls__. The symbolic link should be created in the current working
	      	      	       directory
			
	cp -u  *.html ../ : Copies all the HTML files from the current working directory to the parent of the working directory, only copy dile				   did not exist or were newer than the versions. All HTML files have the extension .html
			
	mv [[:upper:]]* /tmp/u : Moves all files beginning with an uppercase letter to the directory /tmp/u
			
	rm *~ :	Deletes all files in the current working directory that end with the character ~
	
	mkdir -p welcome/to/school/ : Creates the directories welcome/, welcome/to/ and welcome/to/school in the current directory.You are only					     allowed to use two spaces (and lines) in your script, not more
			
	ls -apm : Lists all the files and directories of the current directory, separated by commas (,).Directory names should end with a
		  slash (/) Files and directories starting with a dot (.) should be listed The listing should be alpha ordered, except
		  for the directories . and .. which should be listed at the very beginning Only digits and letters are used to sort; Dig
		  its should come first
			
	file -C -m school : Create a magic file school.mgc that can be used with the command file to detect School data files. School data
	     	   	    files al ways contain the string SCHOOL at offset 0