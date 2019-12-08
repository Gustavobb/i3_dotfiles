#!/bin/bash

######################## FUNCTIONS ######################

unalias cd >/dev/null 2>&1

cd()
{
	builtin cd "$@" && command ls -A --color=auto -F
}

whr()
{
	find / 2>/dev/null | grep -i "$@"
}

mkdirr()
{
	val=$1
	var="${@:$#}"
	p="$(echo $@ | awk '{print length}')"
	obj="$(echo $@ | cut -c 4-$p 2> /dev/null)" 

	#err=0

	# pattern=" |'"
	# if [[ $var =~ $pattern ]]
	# then 
	# 	err=1
	# fi

	if [[ $val = "-m" ]];then
		
		mkdir $obj && command cd $var

	# elif [[ $val = "-f" ]];then
	# 	mkdir $2 && command cd $2
	# 	mkdir ${obj:2} && command ls -A --color=auto -F
	
	# elif [[ $val = "f-" ]];then
	# 	path=$PWD
	# 	mkdir $2 && command cd $2
	# 	echo $2
	# 	mkdir ${obj:2} && command ls -A --color=auto -F
	# 	cd $path

	# elif [[ $val = "c-" ]];then
	# 	for i in $obj; do
	# 		mkdir $i && command cd $i 2 >&/dev/null
	# 	done
	
	# elif [[ $val = "-c" ]];then
	# 	path=$PWD
	# 	for i in $obj; do
	# 		mkdir $i && command cd $i 2 >&/dev/null
	# 	done
	# 	cd $path 2 >&/dev/null

	# 	obj="$(echo $@ | cut -c 6-$p 2> /dev/null)" 
	# 	arr=($obj)
	# 	if [[ $2 =~ ^[0-9]+$ ]]; then
	# 		for i in $arr; do
	# 			for n in $(seq 0 $2); do
	# 				echo $n
	# 				mkdir ${arr} && command cd $i	
	# 			done
	# 			for n in $(seq 0 $2); do
	# 				unset test_array[0]
	# 			done
	# 		done
	# 	else
	# 		echo "plese enter a number after '-c' if you want to create mlt dir"
	# 	fi

	else
		mkdir "$@" && command ls -A --color=auto -F

	fi

	echo $arr
}

touchh()
{
	touch "$@" && command ls -A --color=auto -F
}

rmm()
{
	rm "$@" && command ls -A --color=auto -F
}

#==

mvv()
{
	val=$1
	var="${@:$#}"

	p="$(echo $@ | awk '{print length}')"
	m="$(echo $2 | cut -d'/' -f1- | grep  -o '/' | wc -l)"
	

	obj="$(echo $@ | cut -c 3-$p)" 

	if [[ -d $2 ]]; then
		g="$(echo "$m-1" | bc -l)"
		lst="$(echo $2 | cut -d'/' -f1-$g)"
	else
		g="$(echo "$m" | bc -l)"
		lst="$(echo $2 | cut -d'/' -f1-$g)"
	fi

	if [[ $val = "-" ]]
	then
		mv $obj && command cd $lst && command ls -A --color=auto -F

	elif [[ $val = "--" ]]
	then
		mv $obj && command cd $var && command ls -A --color=auto -F

	elif [[ $val = "-l" ]]
	then
		mv $obj
		echo
		echo $(tput bold)$lst$(tput sgr0)
		ls -A $lst --color=auto -F
		echo
		echo $(tput bold)$var$(tput sgr0)
		ls -A $var --color=auto -F
		echo

	else
		mv "$@" && command ls -A --color=auto -F

	fi
}

cpp()
{
	val=$1
	var="${@:$#}"

	p="$(echo $@ | awk '{print length}')"
	m="$(echo $2 | cut -d'/' -f1- | grep  -o '/' | wc -l)"
	g="$(echo "$m-1" | bc -l)"

	lst="$(echo $2 | cut -d'/' -f1-$m)"
	obj="$(echo $@ | cut -c 3-$p)" 

	if [[ $val = "-" ]]
	then
		cp $obj && command cd $lst && command ls -A --color=auto -F

	elif [[ $val = "--" ]]
	then
		cp $obj && command cd $var && command ls -A --color=auto -F

	elif [[ $val = "-l" ]]
	then
		cp $obj
		echo
		echo $lst
		ls -A $lst --color=auto -F
		echo
		echo $var
		ls -A $var --color=auto -F
		echo

	else
		cp "$@" && command ls -A --color=auto -F

	fi
}

#####################################################3

func_ls()
{
	functions="cd() whr() mkdirr() rmm() mvv() cpp() touchh()"

	if [[ $2 =~ "--help" ]];then
		cat "/home/gubebra/.bash/$1.txt"

	else
		for el in $functions; do
			echo
			echo $el
			echo
		done
	fi

}

######################################################

