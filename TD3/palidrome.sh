function pal {
    local reversed=$(echo "$1" | rev)
    if [ "$1" = "$reversed" ]; then
        echo "$1"
    fi
}

while read line; do
	for word in $line;do
   		pal "$word"
   	done
done < "$1"
