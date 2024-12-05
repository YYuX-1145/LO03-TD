total=0
if [ $# -eq 0 ]; then
    dir="./"
else
    dir="$1"
fi

for item in $(ls $dir); do
	name=$item
	size=$(ls -ld $dir/$item|cut -d ' ' -f 5)
    	echo $item $size
    	total=$(expr $total + $size )
done
echo "total:$total"
		
