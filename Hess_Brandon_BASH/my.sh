# www.lynda.com/Bash-tutorials/Up-Running-Bash-Scripting/142989-2.html

# Creating a basic Bash script.
echo Creating a basic Bash script
#!/bin/bash
# This is a basic bash script.
ls



# Displaying text and echo
echo Displaying text and echo
greeting="hello"

echo $greeting, wold \(planet\)!

echo '$greeting, world (planet)!'
echo
echo
echo
echo "$greeting, world (planet)!"


greeting="hello"

echo $greeting, world \{planet\}!



# Working with variables
echo Working with variables
a=hello
b="Good morning"
c=16

echo $a
echo $b
echo $c
echo "$b! I have $c apples!"



# Command substitution
echo Command substitution
d=$(pwd)
echo $d

a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "the ping was $a"



# Working with numbers
echo Working with numbers
d=2
e=$((d+2))
echo $e
((e++))
echo $e
((e--))
echo $e
echo
((e+=5))
echo $e
((e*=3))
echo $e
((e/=3))
echo $e
((e-=5))
echo $e

f=$((1/3))
echo $f
g=$(echo 1/3 | bc -l)
echo $g



# Comparing values
echo Comparing values
[[ "cat" == "cat" ]]
echo $?

[[ "cat" == "dog" ]]
echo $?

# [[20 > 100]]
# -gt
# echo $?

a=" "
b="cat"
[[ -z $a && -n $b ]]
echo $?



# Working with strings
echo Working with strings
y="hello"
z="world"
w=$y$z
echo $w
echo ${#y}
echo ${#w}
x=${w:3}
echo $w
e=${c:3:4}
echo $e
echo ${c: -4}
echo ${c: -4:3}

fruits="apple banana banana cherry"
echo $fruit
echo ${fruit/banana/durian} #Replaces the first instance
echo ${fruit//banana/durian} #replaces all bananas
echo ${fruit/#apple/banana/durian} #replace if it is in the very beginning
echo ${fruit/#banana/durian} #replace will not work
echo ${fruit/%cherry/durian} #replace the last item
echo ${fruit/%banana/durian} #replace b/c it is not the last item
echo ${fruit/c*/durian}



# Coloring and styling text
echo Coloring and styling text
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"Something went wrong."$none




# Exploring some handy helpers: date and printf
echo Exploring some handy helpers: date and printf
date
date +"%d-%m-%Y"
date +"%H-%M-%S"

printf "Name:\t%s\nID:\t%04d\n" "Scott" "12"
printf "Name:\t%s\nID:\t%04d\n" "Someone" "123"

today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d"



# Working with arrays
echo Working with arrays
a=()
b=("apple" "banana" "cherry")
echo ${b[2]}
b[5]="kiwi"
b+=("mango")
echo ${b[@]}
echo ${b[@]: -1}

declare -A myarray
myarray[color]=blue
myarray["office building"]="HQ West"

echo ${myarray["office building"]} is ${myarray[color]}



# Reading and writing text files
echo Reading and writing text files
echo "Some text" > file.txt
cat file.txt

> file.txt
cat file.txt
echo "Some text" > file.txt
echo "Some more text" >> file.txt
cat file.txt

i=1
while read f; do
	echo "Line $i: $f"
	((i++))
done < file.txt
cat < file.txt



# Using here documents
echo Using here documents
cat << EndOfText
	This is a
	multiline
	text string
EndOfText

ftp -n <<- DoneWithTheUpdate
	open mirrors.xmission.com
	user anonumous nothinghere
	ascii
	cd gutenberg
	get GUTINDEX.01
	bye
DoneWithTheUpdate


cat <<- EndOfText
	This is a
	multiline
	text string
EndOfText

ftp -n <<- DoneWithTheUpdate
        open mirrors.xmission.com
        user anonumous nothinghere
        ascii
        cd gutenberg
        get GUTINDEX.01
        bye
DoneWithTheUpdate



# Solution: Make a script that generates a system report



# Testing truth conditions with the if keywords
echo Testing truth conditions with the if keywords
i=5
if [ $i -gt 4 ]; then
	echo $i is greater than 4!
else
	echo $i is not greater than 4!
fi

j="This is my #1 string"            
if [[ $j =~ [0-9]+ ]]; then
        echo "There are numbers in the string: $i"
else
        echo "There are no numbers in the string: $i"
fi



# Working with while and until loops
echo Working with while and until loops
k=0
while [ $k -le 10 ]; do
	echo k:$k
	((k+=1))
done

l=0
until [ $l -ge 10 ]; do
	echo l:$l
	((l+=1))
done



# Introducing for loops
echo Introducing for loops
for i in 1 2 3
do
	echo $i
done

for i in {1..100..2}
do 
        echo $i
done

# for (( i=1; 1<=10; i++ ))
# do 
#        echo $i
# done

arr=("apple" "banana" "cherry")
for i in ${arr[@]}
do 
        echo $i
done

declare -A arr
arr["name"]="Scott"
arr["id"]="1234"
for i in "${!arr[@]}"
do 
        echo "$i: ${arr[$i]}"
done

for i in $(ls)
do 
        echo "$i"
done



# Selecting behavior using case
echo Selecting behavior using case
a="dog"
case $a in
	cat) echo "Feline";;
	dog|puppy) echo "Canine";;
	*) echo "No match!";;
esac



# Using functions
echo Using functions
function greet {
	echo "Hi there!"
}

echo "And now, a greeting!"
greet


function greet {
        echo "Hi, $1"
}

echo "And now, a greeting!"
greet Scott


function greet {
        echo "Hi, $1! What a nice $2!"
}

echo "And now, a greeting!"
greet Scott Morning
greet Everybody Evening


function numberthings {
	i=1
	for f in $@; do
		echo $i: $f
		((i+=1))
	done
}

numberthings $(ls)

numberthings pine birch maple spruce



# Working with arguments
echo Working with arguments
echo $1
echo $2

for i in $@
do
	echo $i
done

echo "There were $# arguments."



# Working with flags
echo Working with flags
while getopts :u:p:ab option; do
	case $option in
		u) user=$OPTARG;;
		p) pass=$OPTARG;;
		a) echo "Got the A flag";;
		b) echo "Got the B flag";;
		?) echo "I don't know what $OPTARG is!";;
	esac
done

echo "User: $user / Pass: $pass"


# Getting input during execution
echo Getting input during execution
echo "What is your name?"
read name

echo "What is your password?"
read -s pass

read -p "What's your favorite animal? " animal

echo name: $name, pass: $pass, animal: $animal

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html

select animal in "cat" "dog" "bird" "fish"
do
	echo "You selected $animal!"
	break
done


select option in "cat" "dog" "quit"
do
	case $option in
		cat) echo "Cat like to sleep.";;
		dog) echo "Dogs like to play catch.";;
		quit) break;;
		*) echo "I'm not sure what that is.";;
	esac
done


if [ $# -lt 3 ]; then
	cat <<- EOM
	This command requires three arguments:
	username, userid, and favorite number.
	EOM
else
	# the person goes here
	echo "Username: $1"
	echo "Userid: $2"
	echo "Favorite Number: $3"
fi




# Ensuring a response
echo Ensuring a response
read -p "Favorite animal? " a
while [[ -z "$a" ]]; do
	read -p "I need an answer! " a
done
echo "$a was selected."


read -p "Favorite animal? [cat] " a
while [[ -z "$a" ]]; do
        a="cat"
done
echo "$a was selected."


read -p "What year? [nnnn] " a
while [[ ! $a =~ [0-9]{4} ]]; do
	read -p "A year, please! [nnnn] " a
done
echo "Selected year: $a"



# Make a script that uses input
# ch4_solution.sh
