
if [ $# -ne 1 ]; then
    echo "error"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "error
    exit 1
fi
counter=1
while read line; do
    echo "$counter  $line"
    counter=$((counter + 1))
done < "$1"

