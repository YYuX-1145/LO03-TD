function tree {
for item in $(ls $1);do
	if [ -f "$1/$item" ];then
		echo "$2+--$item"
	elif [ -d "$1/$item" ];then
		echo "$2\--$item"
		tree "$1/$item" "$2  "
	else
		echo "error"
	fi
done
}

tree "$(pwd)" ""
