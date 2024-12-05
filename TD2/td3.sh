exec 2>/dev/null
a=$(expr $1 + 1)
if [ $? -eq 0 ];then
	echo "is num"
else
	echo "not num"
fi
