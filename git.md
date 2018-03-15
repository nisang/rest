## git

* reate a new repository on the command line
	
    	echo "# rest" >> README.md
		git init
		git add README.md
		git commit -m "first commit"
		git remote add origin git@github.com:nisang/rest.git
		git push -u origin master
	
* push an existing repository from the command line

		git remote add origin git@github.com:nisang/rest.git
		git push -u origin master

* add file

		git add file.java
		git commit -m "add file.java"
		git push -u origin master

* add branch
		* git push origin master:1.0


* change branche
		* git chekout -b 2.0
		* git branch 2.0
		* git checkout 2.0