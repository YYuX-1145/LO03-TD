d=0
f=0

if [ $# -eq 0 ]; then
    dir="./"
else
    dir="$1"
fi

for item in $(ls $dir); do
    if [ -f "$dir/$item" ]; then
        ((f++))
    elif [ -d "$dir/$item" ]; then
        ((d++))
    fi
done
echo "Files: $f"
echo "Directories: $d"
		
