#exec 2>/dev/null
find $1
if [ $? -eq 1 ];then
	x=$(echo $PATH | tr ':' '\n')
	for line in $x;do
		find "$line/$1"
		if [ $? -eq 0 ];then
			echo "$x/$1"
			exit 0
		fi
	done
	exit 1
else
	echo "$(pwd)/$1"
	exit 0
fi
	
	
