declare -a lines
while read line;do
	lines[$i]=$line
	((i++))
done < $1
i=${#lines[@]}
while [ $i -gt -1 ];do
	echo ${lines[$i]}
	((i--))
done

