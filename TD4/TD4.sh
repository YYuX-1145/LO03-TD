#!/bin/bash
if [ ! -r "/home/yy/listing" ];then
	echo "file not accessible."
	exit 1
fi

declare -a list
i=0
while read line;do
	if [ ${line:0:1} != "#" ];then
		nom=$(echo $line|cut -d ' ' -f 1)
		prenom=$(echo $line|cut -d ' ' -f 2)
		login_name=$(echo ${nom:0:2}${prenom:0:2}|tr 'A-Z' 'a-z')
		echo "<$nom>" "<$prenom>" "<$login_name>"
		list[$i]=$nom
		list[$((i+1))]=$prenom
		list[$((i+2))]=$login_name
		i=$((i+3))
	fi
done < "/home/yy/listing"

if [ $(id -u) -ne 0 ];then
	echo "permission denied."
	exit 1
fi

if [ $# -ne 1 ];then
	echo "arg error"
	exit 0
fi

uid=1001
i=0
if [ $1 == '-a' ];then
password=$(grep guest /etc/shadow | cut -d ":" -f 2 )
while [ $((i+3)) -le ${#list[@]} ];do
	useradd -m -u $uid -g users -c "${list[$i]}-${list[$((i+1))]}-${list[$((i+2))]}" -d "/home/${list[$((i+2))]}" -s "/bin/bash" -p $password ${list[$((i+2))]} 
	echo "useradd : ${list[$i]}-${list[$((i+1))]}-${list[$((i+2))]}"
	i=$((i+3))
	((uid++))
done
elif [ $1 == '-del' ];then
while [ $((i+3)) -le ${#list[@]} ];do
    userdel -r ${list[$((i+2))]}
	echo "userdel : ${list[$i]}-${list[$((i+1))]}-${list[$((i+2))]}"
	i=$((i+3))
done
fi