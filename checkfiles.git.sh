# !/bin/bash

# file navigator based in recursive function

file_navigator () {

	OUT="$(ls -A $1)"
	echo "$(tput setaf 0)$1"
	for object in $OUT
	do
		if [[ ! $object == *".git"* ]] && [[ ! $object == *"README"* ]];then 
			if [[ -d $1$object ]]; then
				echo
				echo "$(tput setaf 12)$object/"
				file_navigator $1$object/
		
			elif [[ -f $1$object ]];then

				cp /$1$object ./$1$object
				echo "$(tput setaf 10)$object"
			fi
		fi
	done
}

# git automatization

git_integraion () {

	git add *
	git commit -m "$1"
	git push orgin master
}

# fancy echo just for fun

fancy_echo () {

	echo 
	echo "$(tput setaf 11)#########"
	echo
	echo "$(tput setaf 11)$1"
	echo 
	echo "$(tput setaf 11)#########"
}

read -p "Commit text: " -n 9 -r
fancy_echo "Navigating trought files"
file_navigator 
fancy_echo "Git push and commit"
git_integraion $REPLY


